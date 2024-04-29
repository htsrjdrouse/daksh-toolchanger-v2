
### TOOLCHANGE MANAGEMENT MACROS

<details><summary>STORE_TOOLHEAD_POSITION</summary>

```
[gcode_macro STORE_TOOLHEAD_POSITION]
variable_toolhead_x:0
variable_toolhead_y:0
variable_toolhead_pos_stored:0
variable_bypass_toolhead_position:0
variable_toolchange_z_move_enabled:1
variable_toolchange_z_move_safe_z_height:2    # Safe Z height before switching to shorter z hops during tool change - useful on beds that are not completely flat and have raised edges
variable_toolchange_z_move_safe_z_height_move:2  # Z Hop distance below safe z height
variable_toolchange_z_move_default:0.8 # Z Hop distance above safe z height
variable_toolchange_z_move_speed:15000
variable_toolchange_z_move_state:0
variable_enable_rscs_fan:1
gcode:
	SET_GCODE_VARIABLE MACRO=STORE_TOOLHEAD_POSITION VARIABLE=toolhead_x VALUE={params.X}
	SET_GCODE_VARIABLE MACRO=STORE_TOOLHEAD_POSITION VARIABLE=toolhead_y VALUE={params.Y}
	SET_GCODE_VARIABLE MACRO=STORE_TOOLHEAD_POSITION VARIABLE=toolhead_pos_stored VALUE=1
	RETRIEVE_TOOLHEAD_POSITION
```

</details>


<details><summary>CLEAR_TOOLHEAD_POSITION</summary>

```
[gcode_macro CLEAR_TOOLHEAD_POSITION]
gcode:
	SET_GCODE_VARIABLE MACRO=STORE_TOOLHEAD_POSITION VARIABLE=toolhead_x VALUE=0
	SET_GCODE_VARIABLE MACRO=STORE_TOOLHEAD_POSITION VARIABLE=toolhead_y VALUE=0
	SET_GCODE_VARIABLE MACRO=STORE_TOOLHEAD_POSITION VARIABLE=toolhead_pos_stored VALUE=0
```

</details>


<details><summary>RETRIEVE_TOOLHEAD_POSITION</summary>

```
[gcode_macro RETRIEVE_TOOLHEAD_POSITION]
gcode:
  M118 X: {printer["gcode_macro STORE_TOOLHEAD_POSITION"].toolhead_x}
  M118 Y: {printer["gcode_macro STORE_TOOLHEAD_POSITION"].toolhead_y}
  M118 POS_STORED: {printer["gcode_macro STORE_TOOLHEAD_POSITION"].toolhead_pos_stored} 
```
  
</details>


### RSCS FAN Macros

<details><summary>SET_RSCS_FAN_STATUS</summary>

```
[gcode_macro SET_RSCS_FAN_STATUS]
gcode:
    SET_GCODE_VARIABLE MACRO=STORE_TOOLHEAD_POSITION VARIABLE=enable_rscs_fan VALUE={params.ENABLE}
    {% if params.ENABLE|int ==0 %}
      RSCS_off
    {% else %}
      RSCS_on
    {% endif %}    
```

</details>


<details><summary>RSCS_on</summary>

```
[gcode_macro RSCS_on]
gcode: 
  
  SET_FAN_SPEED FAN=RSCS SPEED=1
```

</details>


<details><summary>RSCS_on</summary>

```
[gcode_macro RSCS_off]
gcode: 
  SET_FAN_SPEED FAN=RSCS SPEED=0
```

</details>


<details><summary>RSCS_LAYER_CHECK</summary>

```
[gcode_macro RSCS_LAYER_CHECK]
gcode:

  SET_CURRENT_PRINT_LAYER LAYER={params.LAYER} BEDTEMP={printer.heater_bed.target}
  {% if printer["gcode_macro STORE_TOOLHEAD_POSITION"].enable_rscs_fan|int == 1 %} 
    {% if params.LAYER|int > 0 %} #and printer.heater_bed.target|int <= 80 and printer.heater_bed.target|int > 0 %}
      RSCS_on
    {% else %}
      RSCS_off
    {% endif %}	
  {% endif %}	
```

</details>



### Toolchange Z Move Macros


<details><summary>TOOLCHANGE_Z_MOVE_START</summary>


```
[gcode_macro TOOLCHANGE_Z_MOVE_START]
gcode:
  {% if printer["gcode_macro STORE_TOOLHEAD_POSITION"].toolchange_z_move_enabled|int == 1 and printer["gcode_macro STORE_TOOLHEAD_POSITION"].toolchange_z_move_state|int == 0 %}
    G91
    {% if printer.toolhead.position[2]|int > printer["gcode_macro STORE_TOOLHEAD_POSITION"].toolchange_z_move_safe_z_height|int %}
      G1 Z{printer["gcode_macro STORE_TOOLHEAD_POSITION"].toolchange_z_move_default|int} F{printer["gcode_macro STORE_TOOLHEAD_POSITION"].toolchange_z_move_speed|int}
    {% else %}
      G1 Z{printer["gcode_macro STORE_TOOLHEAD_POSITION"].toolchange_z_move_safe_z_height_move|int} F{printer["gcode_macro STORE_TOOLHEAD_POSITION"].toolchange_z_move_speed|int}
    {% endif %}    
    SET_GCODE_VARIABLE MACRO=STORE_TOOLHEAD_POSITION VARIABLE=toolchange_z_move_state VALUE=1
    G90
  {% endif %}
```

</details>



<details><summary>TOOLCHANGE_Z_MOVE_END</summary>

```
[gcode_macro TOOLCHANGE_Z_MOVE_END]
gcode:
  {% if printer["gcode_macro STORE_TOOLHEAD_POSITION"].toolchange_z_move_enabled|int == 1 and printer["gcode_macro STORE_TOOLHEAD_POSITION"].toolchange_z_move_state|int == 1 %}
    G91
    G1 Z-{printer["gcode_macro STORE_TOOLHEAD_POSITION"].toolchange_z_move_default|int} F{printer["gcode_macro STORE_TOOLHEAD_POSITION"].toolchange_z_move_speed|int}
    SET_GCODE_VARIABLE MACRO=STORE_TOOLHEAD_POSITION VARIABLE=toolchange_z_move_state VALUE=0
    G90
  {% endif %}
```
</details>


### Toolchange TOOL Management Macros

<details><summary>CHECK_CORRECT_TOOL_LOADED</summary>

```
[gcode_macro CHECK_CORRECT_TOOL_LOADED]
gcode:
  {% if printer["gcode_macro VARIABLES_LIST"].active_tool|int == -2 %}
    SAVE_CURRENT_TOOL T=-1
    {% set current_tool = -1 %}
  {% else %}
    {% set current_tool = printer["gcode_macro VARIABLES_LIST"].active_tool|int %}
  {% endif %}

  {% if printer.toolhead.homed_axes !="xyz" %} 
    SET_KINEMATIC_POSITION X=10 Y=10 Z=50
    G28 Y
    G28 X
    G0 X165 Y140 F10000
  {% endif %}
  T{params.TOOL}
  SET_CURRENT_TOOL T={params.TOOL}
```

</details>


<details><summary>CYCLE_ALL_TOOLS</summary>

```    
[gcode_macro CYCLE_ALL_TOOLS]
gcode:
     SET_GCODE_VARIABLE MACRO=STORE_TOOLHEAD_POSITION VARIABLE=bypass_toolhead_position VALUE=1
     T0
     T1
     INITIALIZE_TOOL_USE_COUNT
     T{params.FINAL_TOOL}
     SET_GCODE_VARIABLE MACRO=STORE_TOOLHEAD_POSITION VARIABLE=bypass_toolhead_position VALUE=0
```

</details>


#### TEST MACROS

<details><summary>FILAMENT_EXTRA_EXTRUDE_LENGTH</summary>

```
[gcode_macro FILAMENT_EXTRA_EXTRUDE_LENGTH]
variable_filament_extra_extrude_length:0
gcode:
```

</details>


<details><summary>SET_FILAMENT_EXTRA_EXTRUDE_LENGTH</summary>

```
[gcode_macro SET_FILAMENT_EXTRA_EXTRUDE_LENGTH]
gcode:
  SET_GCODE_VARIABLE MACRO=FILAMENT_EXTRA_EXTRUDE_LENGTH VARIABLE=filament_extra_extrude_length VALUE={params.EL}
```
</details>


<details><summary>RESET_FILAMENT_EXTRA_EXTRUDE_LENGTH</summary>

```
[gcode_macro RESET_FILAMENT_EXTRA_EXTRUDE_LENGTH]
gcode:
  SET_GCODE_VARIABLE MACRO=FILAMENT_EXTRA_EXTRUDE_LENGTH VARIABLE=filament_extra_extrude_length VALUE=0
```

</details>

<details><summary>GET_FILAMENT_EXTRA_EXTRUDE_LENGTH</summary>

```
[gcode_macro GET_FILAMENT_EXTRA_EXTRUDE_LENGTH]
gcode:
  M118 Filament Extra Extrude {printer["gcode_macro FILAMENT_EXTRA_EXTRUDE_LENGTH"].filament_extra_extrude_length}
```
</details>


<details><summary>NOZZLE_WIPE_VARIABLE</summary>
  
```
[gcode_macro NOZZLE_WIPE_VARIABLE]
  variable_nozzle_wipe:0
  gcode:
```

</details>

<details><summary>NOZZLE_WIPE_ON</summary>

```
[gcode_macro NOZZLE_WIPE_ON]
gcode:
  SET_GCODE_VARIABLE MACRO=NOZZLE_WIPE_VARIABLE VARIABLE=nozzle_wipe VALUE=1
```
</details>

<details><summary>NOZZLE_WIPE_RESET</summary>

```
[gcode_macro NOZZLE_WIPE_RESET]
gcode:
  SET_GCODE_VARIABLE MACRO=NOZZLE_WIPE_VARIABLE VARIABLE=nozzle_wipe VALUE=0
```
</details>

<details><summary>GET_NOZZLE_WIPE</summary>

```  
[gcode_macro GET_NOZZLE_WIPE]
gcode:
  M118 NOZZLE WIPE {printer["gcode_macro NOZZLE_WIPE_VARIABLE"].nozzle_wipe}
```
</details>


<details><summary>TOOLHEAD_INFO</summary>

```  
[gcode_macro TOOLHEAD_INFO]
gcode:
  M118 {printer.toolhead}
  M118 {printer.idle_timeout.state}
```

</details>


<details><summary>TEST_UNLOCK</summary>

```  
[gcode_macro TEST_UNLOCK]
  gcode:
    G90
    G0 X{params.X} F5000
    G0 Y{params.Y} F5000
    G91 
    G0 X14 F3000
    G0 X-2 F3000
    G0 Y-100 F3000
    g90
```
</details>

<details><summary>TEST_LOCK</summary>

```  
[gcode_macro TEST_LOCK]
  gcode:
    G90
    G0 X{params.X} F5000
    G0 Y{params.Y} F5000
    G91 
    G1 X-14 F3000
    G1 X2 F3000
    G0 Y-100 F3000
    g90
```
</details>


<details><summary>HOME_XY</summary>

```
[gcode_macro HOME_XY]
 gcode:
  G28 Y0
  G28 X0   
  G0 X100
  g90
```
</details>

<details><summary>TEST_TOOLS</summary>

```  
[gcode_macro TEST_TOOLS]
  gcode:
    SET_GCODE_VARIABLE MACRO=STORE_TOOLHEAD_POSITION VARIABLE=bypass_toolhead_position VALUE=1
    G28
    G0 X126 Y250
    {% for move in range(50) %}
        T0
        #KTCC_TOOL_DROPOFF_ALL
        T1
        T2
        T3
        T4   
    {% endfor %}
    T0
    SET_GCODE_VARIABLE MACRO=STORE_TOOLHEAD_POSITION VARIABLE=bypass_toolhead_position VALUE=0
```
</details>

<details><summary>T_1</summary>

```  
[gcode_macro T_1]
gcode:
  KTCC_TOOL_DROPOFF_ALL
```
</details>

<details><summary>SET_GLOBAL_Z_OFFSET</summary>

```  
[gcode_macro SET_GLOBAL_Z_OFFSET]
gcode:
  SET_GCODE_VARIABLE MACRO=VARIABLES_LIST VARIABLE=global_z_offset VALUE={params.OFFSET|float}
```

</details>
