
# Concepts about klipper programming environment as it relates to toolchanging. #


## SAVE_GCODE_STATE ##

In Klipper, SAVE_GCODE_STATE is a command that saves the current state of the G-code parser, allowing the printer to resume a print job from the exact position where it was paused or interrupted.

When SAVE_GCODE_STATE is executed, Klipper saves the following information:

1. Current G-code line number
2. Current G-code command (e.g., G1, G28, etc.)
3. Current coordinates (X, Y, Z, E)
4. Current extruder temperature
5. Current bed temperature

This saved state allows Klipper to resume the print job from the exact position where it was paused or interrupted, ensuring that the print continues correctly.
SAVE_GCODE_STATE is typically used in conjunction with LOAD_GCODE_STATE to resume a print job after a pause or interruption. The workflow is as follows:
SAVE_GCODE_STATE saves the current state before pausing or interrupting the print.
The print is paused or interrupted (e.g., due to a tool change, error, or manual pause).
LOAD_GCODE_STATE loads the saved state, restoring the printer to the exact position where it was paused or interrupted.
The print resumes from the loaded state.
By using SAVE_GCODE_STATE and LOAD_GCODE_STATE, Klipper ensures that print jobs can be resumed accurately and reliably, even after interruptions or pauses.

SAVE_GCODE_STATE is called gcode_macros.cfg, toolchanger.cfg, klipper_toolchanger/M600.cfg and klipper_toolchanger/pause_resume.cfg: 

### gcode_macros.cfg ###

```
gcode_macros.cfg:    SAVE_GCODE_STATE NAME=PRIME_LINE_state
gcode_macros.cfg:    SAVE_GCODE_STATE NAME=BEFORE_CLEAN
gcode_macros.cfg:    SAVE_GCODE_STATE NAME=PURGE_state
```

### klipper_toolchanger/M600.cfg ###

```
klipper_toolchanger/M600.cfg:  SAVE_GCODE_STATE NAME=M600_state
```

### klipper_toolchanger/pause_resume.cfg ###

```
klipper_toolchanger/pause_resume.cfg:   SAVE_GCODE_STATE NAME=PAUSE_state
klipper_toolchanger/pause_resume.cfg:	 	SAVE_GCODE_STATE NAME=PAUSE_state
```

### toolchanger.cfg ###

```
toolchanger.cfg:  SAVE_GCODE_STATE NAME=tool_unlock_state                                         # Save gcode state
toolchanger.cfg:  SAVE_GCODE_STATE NAME=tool_lock_state                                           # Save gcode state
toolchanger.cfg:  SAVE_GCODE_STATE NAME=TOOL_PICKUP                                    # Save GCODE state. Will be restored at the end of SUB_TOOL_PICKUP_END
toolchanger.cfg:  SAVE_GCODE_STATE NAME=TOOL_DROPOFF_002                        # Save GCode state. 
```

LOAD_GCODE_STATE is not used in this software. 


## VERIFY_TOOLCHANGE_DURING_PRINT DURATION=30 FORCE=0 ##


In Klipper, when DURATION is specified in a command like VERIFY_TOOLCHANGE_DURING_PRINT DURATION=30 FORCE=0, it defines the verification window during which Klipper monitors the tool change process.
Here's how it works:

When the VERIFY_TOOLCHANGE_DURING_PRINT command is executed, Klipper starts monitoring the tool change process.

The DURATION parameter (in this case, 30 seconds) specifies the time window during which Klipper will verify the tool change.

The printer does not pause during this verification window. Instead, Klipper monitors the tool change process concurrently while the printer continues to move and execute G-code commands.

Within the 30-second verification window, Klipper checks the tool change status (e.g., sensor readings, tool presence, etc.) to ensure the tool change is successful.

If the verification fails within the 30-second window (e.g., sensors indicate an error), Klipper will pause the print and wait for manual intervention (due to FORCE=0).

In summary, the DURATION parameter defines the time window during which Klipper verifies the tool change process, but it does not cause the printer to pause. The verification occurs concurrently with the print job, allowing the printer to continue moving while Klipper monitors the tool change.

So if you printer is fails after loading and docking tools you may want to extend the DURATION. 

FORCE=0: This parameter controls the behavior if the tool change verification fails. A value of 0 means that if the verification fails, the print will pause and wait for manual intervention to resume. If FORCE were set to 1, the print would abort instead of pausing.

```
[gcode_macro VERIFY_TOOLCHANGE_DURING_PRINT]
        gcode:
                M118 "VERIFY_TOOLCHANGE_DURING_PRINT in {params.DURATION} seconds with printer state: {printer.idle_timeout.state} FORCE: {params.FORCE}"
                {% if printer.idle_timeout.state == "Printing" or params.FORCE|int == 1 %}
                        M118 "EXECUTING VERIFY_TOOLCHANGE_DURING_PRINT in {params.DURATION} seconds"
                        UPDATE_DELAYED_GCODE ID=_DELAYED_CHECK_MACHINE_STATE_QUICK DURATION=0
                        UPDATE_DELAYED_GCODE ID=_DELAYED_CHECK_MACHINE_STATE_QUICK DURATION={params.DURATION}
                {% endif %}
```

Let's break down this macro:

Macro Name: VERIFY_TOOLCHANGE_DURING_PRINT

Purpose: This macro verifies a tool change during a print job, ensuring the printer is in a safe state.
G-code:

M118 "VERIFY_TOOLCHANGE_DURING_PRINT in {params.DURATION} seconds with printer state: {printer.idle_timeout.state} FORCE: {params.FORCE}":

Prints a message to the console indicating the start of the verification process, including the duration, printer state, and force setting.

{% if printer.idle_timeout.state == "Printing" or params.FORCE|int == 1 %}:

Conditional statement that checks two conditions:
printer.idle_timeout.state == "Printing": If the printer is currently printing.
params.FORCE|int == 1: If the FORCE parameter is set to 1 (abort print on failure).
If either condition is true, the code inside the {% if %} block is executed.

M118 "EXECUTING VERIFY_TOOLCHANGE_DURING_PRINT in {params.DURATION} seconds":
Prints a message to the console indicating the verification process is executing.

UPDATE_DELAYED_GCODE ID=_DELAYED_CHECK_MACHINE_STATE_QUICK DURATION=0:
Resets a delayed G-code command ( _DELAYED_CHECK_MACHINE_STATE_QUICK ) to execute immediately ( DURATION=0 ).

UPDATE_DELAYED_GCODE ID=_DELAYED_CHECK_MACHINE_STATE_QUICK DURATION={params.DURATION}:
Updates the delayed G-code command to execute after the specified duration ( {params.DURATION} seconds).

In summary, this macro:

1. Prints a message indicating the start of the verification process.
2. Checks if the printer is printing or if FORCE is set to 1.
3. If the conditions are met, it prints a message indicating the verification is executing and updates a delayed G-code command to execute after the specified duration.
The delayed G-code command (_DELAYED_CHECK_MACHINE_STATE_QUICK) is defined elsewhere in the Klipper configuration and performs a quick machine state check. If the verification fails, the print will be paused or aborted, depending on the FORCE setting.