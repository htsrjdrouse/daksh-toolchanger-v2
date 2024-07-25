
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

## _DELAYED_CHECK_MACHINE_STATE_QUICK ##

```
[delayed_gcode _DELAYED_CHECK_MACHINE_STATE_QUICK]
initial_duration: 0
gcode:
        #M118 "Evaluating Machine State"
        _EVALUATE_MACHINE_STATE_QUICK
        {% if printer.idle_timeout.state == "Printing" %}
                VERIFY_TOOLCHANGE_DURING_PRINT DURATION=5 FORCE=0
        {% endif %}
```

Macro Name: _DELAYED_CHECK_MACHINE_STATE_QUICK

Type: Delayed G-code macro

Purpose: This macro checks the machine state and verifies tool changes during printing.

Configuration:

initial_duration: 0: The macro is initially set to execute immediately (0 seconds delay).

G-code:

#M118 "Evaluating Machine State": A commented-out line that would print a message to the console if uncommented.
_EVALUATE_MACHINE_STATE_QUICK: Calls another macro (not shown here) that quickly evaluates the machine state.

{% if printer.idle_timeout.state == "Printing" %}: Conditional statement that checks if the printer is currently printing.
VERIFY_TOOLCHANGE_DURING_PRINT DURATION=5 FORCE=0: If the printer is printing, this line executes the VERIFY_TOOLCHANGE_DURING_PRINT macro (explained earlier) with:
DURATION=5: Verification window of 5 seconds.
FORCE=0: Pause print on failure, don't abort.

In summary, this macro:

Evaluates the machine state quickly.

If the printer is printing, it verifies tool changes during the next 5 seconds.

If verification fails, the print will be paused (due to FORCE=0).

This macro is likely used in conjunction with the previous one to create a delayed verification process. The UPDATE_DELAYED_GCODE commands in the previous macro update the execution time of this macro, allowing it to run at a later time (e.g., after a tool change).

## Delayed G-code macros ##

In Klipper, a Delayed G-code macro is a type of macro that allows you to execute G-code commands at a later time, rather than immediately.

Key characteristics:

Delayed execution: Delayed G-code macros are executed after a specified delay time, which can be set using the initial_duration parameter or updated using the UPDATE_DELAYED_GCODE command.

G-code commands: Delayed G-code macros contain G-code commands, just like regular macros, but they are executed at a later time.

Async execution: Delayed G-code macros are executed asynchronously, meaning they don't block the execution of other macros or G-code commands.

Use cases:

Tool change verification: Verify tool changes after a short delay to ensure the tool is properly seated and ready for use.

Machine state checks: Check the machine state (e.g., temperature, position) after a delay to ensure everything is stable before proceeding.

Timed actions: Perform actions at specific times during a print, such as retracting the filament at a certain height.

Syntax:
Delayed G-code macros are defined using the following syntax:

```
[delayed_gcode <macro_name>]
initial_duration: <delay_time>
gcode:
  # G-code commands to execute after the delay
```

Replace <macro_name> with the name of your macro, <delay_time> with the initial delay time (in seconds), and add your G-code commands under the gcode section.

By using delayed G-code macros, you can create complex workflows and automate tasks that require timed execution, making your 3D printing experience more efficient and reliable.


## _EVALUATE_MACHINE_STATE_QUICK ##

This is the logic that evaluates the each of the tool coupling and docking sensors. 

```
[gcode_macro _EVALUATE_MACHINE_STATE_QUICK]
gcode:
  {% set allTools = printer["gcode_macro VARIABLES_LIST"].tools %}
  {% set activeTools = [] %}
  {% set accountedTools = [] %}
  #M118 "--->_EVALUATE_MACHINE_STATE_QUICK"
  {% for tool in allTools %}
          #We do both mechanical endstops individually to catch the case where carriage is sitting flush with a tool while it is still in dock
          {% if printer["atc_switch tc"~tool].state == "PRESSED" %}
                  {activeTools.append(tool|int) or ""}
                  {accountedTools.append(tool) or ""}
          {% endif %}
          {% if printer["atc_switch td"~tool].state == "PRESSED" %}
                        {accountedTools.append(tool) or ""}
          {% endif %}
  {% endfor %}
  #M118 Active Tools {activeTools}
  #M118 Account Tools {accountedTools}
  #M118 All Tools {allTools}
  {% if accountedTools|length !=  allTools|length or printer["gcode_macro VARIABLES_LIST"].tc_state == -1 %}
         #Error Detected
         #M118 "Tools Mismatch"     
        _EVALUATE_MACHINE_STATE
  {% else %}
        # Check if Active Tool has changed
        #M118 Active Tools {activeTools}
        {% if activeTools|length > 0 %}
                {% set active_tool = activeTools[0]|int %}
        {% else %}
                {% set active_tool = -1 %}
        {% endif %}
        #M118 "Active Tool {active_tool}"
        {% if active_tool != printer["gcode_macro VARIABLES_LIST"].active_tool %}
                 #M118 "Active Tool has Changed"            
             _EVALUATE_MACHINE_STATE
        {% endif %}
  {% endif %}
```

## _EVALUATE_MACHINE_STATE ##

This is the more thorough analysis of the coupling and docking sensors. 

```
[gcode_macro _EVALUATE_MACHINE_STATE]
gcode:
  {% set allTools = printer["gcode_macro VARIABLES_LIST"].tools %}
  {% set activeTools = [] %}
  {% set dockedTools = [] %}
  {% set accountedTools = [] %}
  {% set errorTools = [] %}
  {% for tool in allTools %}
        #Find All Tools attached to the carriage - should be only 1
        {% if printer["atc_switch tc"~tool].state == "PRESSED" %}
                {activeTools.append(tool|int) or ""}
                {accountedTools.append(tool|int) or ""}
        {% endif %}
        #Find All Tools attached to the docks - should be maximum num tools               
        {% if printer["atc_switch td"~tool].state == "PRESSED" %}
                {dockedTools.append(tool|int) or ""}
                {accountedTools.append(tool|int) or ""}
        {% endif %}
  {% endfor %}
  #Ensure each tool only shows up either in active or docked list - if not, throw error with the specific tool
  #M118 Active Tools {activeTools}
  #M118 Docked Tools {dockedTools}
  {% if (activeTools|length|int <= 1) and (activeTools|length + dockedTools|length ==  allTools|length ) %}

                #All Is Well- all tools are accounted for 
                M118 "All Tools Accounted For - Proceeding with Normal Startup"
                {% if activeTools|length > 0 %}
                        SET_GCODE_VARIABLE MACRO=VARIABLES_LIST VARIABLE=active_tool VALUE={activeTools[0]}
                {% else %}
                        SET_GCODE_VARIABLE MACRO=VARIABLES_LIST VARIABLE=active_tool VALUE=-1 #No Tool Attached
                {% endif %}
                SET_GCODE_VARIABLE MACRO=VARIABLES_LIST VARIABLE=tc_state VALUE=0
                SET_GCODE_VARIABLE MACRO=VARIABLES_LIST VARIABLE=tc_error_code VALUE=0
  {% else %}
                #Check if multiple tools are showing up as attached to carriage - could be an issue with the carriage attach hall effect sensor on a docked tool returning a success
                  {% if (activeTools|length == 0) and (dockedTools|length <  allTools|length ) %}

                        # A Tool should be attached to the carriage but isnt - maybe it has fallen off during printing
                        M118 " A Tool should be attached to the carriage but No Tool is present"
                        {% set allToolsTemp = allTools %}
                        {% for tool in accountedTools %}
                                {allToolsTemp.pop(allToolsTemp.index(tool))}
                        {% endfor %}

                        {% for tool in allToolsTemp %}
                                {errorTools.append(tool) or ""}
                        {% endfor %}
                        SET_GCODE_VARIABLE MACRO=VARIABLES_LIST VARIABLE=tc_state VALUE=-1
                        SET_GCODE_VARIABLE MACRO=VARIABLES_LIST VARIABLE=tc_error_code VALUE=1
                  {% else %}
                        {% if activeTools|length > 1 %}
                                {% set allToolsTemp = allTools %}
                                M118 "Multiple Tools Showing up as attached to carriage"
                                {% for tool in activeTools %}
                                        {% if printer["atc_switch tc"~tool].state == "PRESSED" and printer["atc_switch td"~tool].state == "PRESSED" %}
                                                {errorTools.append(tool) or ""}
                                        {% endif %}
                                {% endfor %}
                                SET_GCODE_VARIABLE MACRO=VARIABLES_LIST VARIABLE=tc_state VALUE=-1
                                SET_GCODE_VARIABLE MACRO=VARIABLES_LIST VARIABLE=tc_error_code VALUE=3
                        {% else %}
                                # Check if any tools shows up in both active and docked lists - possible if the carriage is sitting flush with a tool while it is still in dock
                                {% if activeTools|length + dockedTools|length > allTools|length and printer["gcode_macro VARIABLES_LIST"]["print_status"]|int != 1 %}
                                        M118 "Error: Tools are showing up in both active and docked list"
                                        {% set dockedToolsTemp = dockedTools %}
                                        {% for tool in activeTools %}
                                                        {errorTools.append(dockedToolsTemp.pop(dockedToolsTemp.index(tool))) or ""}
                                        {% endfor %}
                                        SET_GCODE_VARIABLE MACRO=VARIABLES_LIST VARIABLE=tc_state VALUE=-1
                                        SET_GCODE_VARIABLE MACRO=VARIABLES_LIST VARIABLE=tc_error_code VALUE=4   
                                        {% else %}
                                                #Check if any of the tools supposed to be docked is not properly seated in the dock
                                                {% if dockedTools|length !=  allTools|length - 1 %}
                                                                M118 "Mismatch in number of tools docked"
                                                                {% set allToolsTemp = allTools %}
                                                                {% for tool in accountedTools %}
                                                                        {allToolsTemp.pop(allToolsTemp.index(tool))}
                                                                {% endfor %}
                                                                {% for tool in allToolsTemp %}
                                                                        {errorTools.append(tool) or ""}
                                                                {% endfor %}
                                                                SET_GCODE_VARIABLE MACRO=VARIABLES_LIST VARIABLE=tc_state VALUE=-1
                                                                SET_GCODE_VARIABLE MACRO=VARIABLES_LIST VARIABLE=tc_error_code VALUE=2

                                                {% endif %}
                                        {% endif %}
                        {% endif %}
                {% endif %}
{% endif %}
  {% if errorTools|length > 0 %}
        # Error Tools Found  - set the LEDS on error tools and enclosure to the ERROR state
        M118 "Error Tools: " {errorTools}
        {% for tool in errorTools %}
           #Blink STATUS LEDS on the Error Tools
                SET_STATUS_LED_ERROR_START T={tool}
        {% endfor %}
        SET_ENCLOSURE_ERROR_START
        PAUSE_AND_ALERT
  {% else %}

          # All Checked out - set the LEDS on all tools and enclosure to the default ALL OK state
          {% if activeTools|length > 0 %}
                {% for tool in activeTools %}
                        #M118 "Set Active Tool {tool}"
                        SET_STATUS_LED_LOCK T={tool}
                        _SET_CURRENT_TOOL T={tool}
                {% endfor %}
          {% else %}
                         # M118 "Set Active Tool {tool}"
                        _SET_CURRENT_TOOL T=-1
          {% endif %}


          {% for tool in dockedTools %}
                {% if printer["gcode_macro VARIABLES_LIST"]["print_status"]|int == 1%}
                        {% if printer["gcode_macro VARIABLES_LIST"]["t"~tool~"_used_in_print"]|int == 1%}
                                SET_STATUS_LED_DOCK T={tool}
                        {% else %}
                                SET_STATUS_LED_NOT_IN_USE T={tool}
                        {% endif %}
                {% else %}
                                SET_STATUS_LED_DOCK T={tool}                    
                {% endif %}
          {% endfor %}

          SET_ENCLOSURE_DEFAULT

  {% endif %}
```




