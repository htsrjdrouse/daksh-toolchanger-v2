I am trying to figure out how to run this code and am providing some notes as I get a handle of this. There are some tool differences between the original daksh design and my version namely the optical probe sensor will be used used but instead use a detachable probe but this could still use the same pin, also (just because I accidently purchased the EBB42 instead of the EBB36), the pin designation will be different in some cases since I also am using EBB36 too. Also, instead of 4 tools, I am just going to use 2. 
<ul><ol>
<li></li>1. One of the things you need to do when installing this is that you need to move the files in the modules folder into  ~/klipper/klippy/extras/, not moving the modules directory and subdirectories, but the files in the directory/subdirectories. </li>
<li></li>2. If you use less or more tools then just 4 (in my case I am using 2), then you need to make sure you indicate that. Here is a list of areas that may need to be modified:</li>

</ul>

   a. In toolchange_management.cfg, you have this code (currently I do not know what these gcode macros do)

<code>
[gcode_macro CYCLE_ALL_TOOLS]
gcode:
     SET_GCODE_VARIABLE MACRO=STORE_TOOLHEAD_POSITION VARIABLE=bypass_toolhead_position VALUE=1
     T0
     T1
     T2 <- delete
     T3 <- delete
     T4 <- delete
     INITIALIZE_TOOL_USE_COUNT
     T{params.FINAL_TOOL}
     SET_GCODE_VARIABLE MACRO=STORE_TOOLHEAD_POSITION VARIABLE=bypass_toolhead_position VALUE=0

[gcode_macro TEST_TOOLS]
  gcode:
    SET_GCODE_VARIABLE MACRO=STORE_TOOLHEAD_POSITION VARIABLE=bypass_toolhead_position VALUE=1
    G28
    G0 X126 Y250
    {% for move in range(50) %}
        T0
        #KTCC_TOOL_DROPOFF_ALL
        T1
        T2 <- delete
        T3 <- delete
        T4 <- delete
    {% endfor %}
    T0
    SET_GCODE_VARIABLE MACRO=STORE_TOOLHEAD_POSITION VARIABLE=bypass_toolhead_position VALUE=0
</code>

Here is the list of them:

[gcode_macro STORE_TOOLHEAD_POSITION]
[gcode_macro CLEAR_TOOLHEAD_POSITION]
[gcode_macro RETRIEVE_TOOLHEAD_POSITION]
[gcode_macro SET_RSCS_FAN_STATUS]
[gcode_macro RSCS_on]
[gcode_macro RSCS_off]
[gcode_macro RSCS_LAYER_CHECK]
[gcode_macro TOOLCHANGE_Z_MOVE_START]
[gcode_macro TOOLCHANGE_Z_MOVE_END]
[gcode_macro CHECK_CORRECT_TOOL_LOADED]
[gcode_macro CYCLE_ALL_TOOLS]
[gcode_macro FILAMENT_EXTRA_EXTRUDE_LENGTH]
[gcode_macro SET_FILAMENT_EXTRA_EXTRUDE_LENGTH]
[gcode_macro RESET_FILAMENT_EXTRA_EXTRUDE_LENGTH]
[gcode_macro GET_FILAMENT_EXTRA_EXTRUDE_LENGTH]
[gcode_macro NOZZLE_WIPE_VARIABLE]
[gcode_macro NOZZLE_WIPE_ON]
[gcode_macro NOZZLE_WIPE_RESET]
[gcode_macro GET_NOZZLE_WIPE]
[gcode_macro TOOLHEAD_INFO]
[gcode_macro TEST_UNLOCK]
[gcode_macro TEST_LOCK]
[gcode_macro HOME_XY]
[gcode_macro TEST_TOOLS]
[gcode_macro T_1]
[gcode_macro SET_GLOBAL_Z_OFFSET]


b. Also in crash_detection.cfg there are indications to tools 1-4 so here this file also needs to be modified:

[gcode_macro VARIABLES_LIST]
variable_tools:[0,1,2,3,4]   <- modify to [0,1]
variable_active_tool:-1
variable_tc_state:0 #-1:Error, 0: Operational
variable_tc_error_code:0 # 0: No Error, 1: No Tool Attached to Carriage, 2: Tool Dock Failure, 3: Multiple Tools Attached  
variable_global_z_offset:0
variable_error_tools:[]
variable_t0_used_in_print:0
variable_t1_used_in_print:0
variable_t2_used_in_print:0   <- delete
variable_t3_used_in_print:0   <- delete
variable_t4_used_in_print:0   <- delete
variable_print_status:0
variable_current_layer:0
variable_current_bed_temp:0
variable_pause_type:0 # 0: No Error, 1:ToolChanger Error 2: Filament Error

gcode:


In crash_detection.cfg, has these macros. 

There is also a bunch fo gcode macros in crash_detection.cfg:

[gcode_macro VARIABLES_LIST]
[gcode_macro _EVALUATE_MACHINE_STATE_QUICK]
[gcode_macro _EVALUATE_MACHINE_STATE]
[gcode_macro _SET_CURRENT_TOOL]
[gcode_macro GET_TOOLS_FOR_PRINT]
[gcode_macro RESET_TOOLS_FOR_PRINT]
[gcode_macro SET_TOOL_FOR_PRINT]
[gcode_macro SET_PRINT_STATUS_START]
[gcode_macro RESET_PRINT_STATUS]
[gcode_macro SET_CURRENT_PRINT_LAYER]
[gcode_macro _INITIALIZE_ALL_TOOLS]
[gcode_macro RESET_DELAY_AND_CHECK_MACHINE_STATUS]
[gcode_macro VERIFY_TOOLCHANGE_DURING_PRINT]
[gcode_macro RESET_TOOLCHANGER]
[gcode_macro PAUSE_AND_ALERT]


3. I don't want to use the tool probe, so need to remove this:
In toolchanger.cfg, need to comment out this line:  SET_ACTIVE_TOOL_PROBE T={params.T}

4. Commented this out: SET_ENCLOSURE_DEFAULT. 
This is in crash_detection.cfg and in klipper_toolchanger/pause_resume.cfg

5. Commented out: SET_STATUS_LED_LOCK
Klipper/config/klipper_toolchanger/pause_resume.cfg:		SET_STATUS_LED_LOCK T={printer["gcode_macro VARIABLES_LIST"].active_tool}
Klipper/config/crash_detection.cfg:			SET_STATUS_LED_LOCK T={tool}
Klipper/config/toolchanger.cfg:  SET_STATUS_LED_LOCK T={params.T}
Klipper/config/toolchanger.cfg:    SET_STATUS_LED_LOCK T={tool}

5. Enabled [force_move] in printer_config.cfg like so:
[force_move]
enable_force_move: True

6. Commented out: SET_STATUS_LED_NOT_IN_USE
Klipper/config/crash_detection.cfg:		  		SET_STATUS_LED_NOT_IN_USE T={tool}
Klipper/config/crash_detection.cfg:  	 SET_STATUS_LED_NOT_IN_USE T={tool}

7. In status_led.cfg, I had to remove all the tool references that are not being used, including the "neopixel cled" stuff 

8. Had to add this, ktcc_dock_move_speed = 3000 in variables.cfg

9. Also in status_led.cfg, I commented out the enclosure stuff, like so:

#[gcode_macro LED_ENCLOSURE_EFFECT_STOP]
#gcode:
#   SET_LED_EFFECT EFFECT=enclosure_error STOP=1
#   SET_LED_EFFECT EFFECT=enclosure_default STOP=1

#[gcode_macro SET_ENCLOSURE_ERROR_START]
#gcode:
#      LED_ENCLOSURE_EFFECT_STOP
#      SET_LED_EFFECT EFFECT=enclosure_error  
   
#[gcode_macro SET_ENCLOSURE_DEFAULT]
#gcode:
#      LED_ENCLOSURE_EFFECT_STOP
#      SET_LED_EFFECT EFFECT=enclosure_default 



