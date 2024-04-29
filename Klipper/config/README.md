
<h2>Gcode files relevant to the Dakash toolchanger system</h2>

These files located in ~/printer_data/config/

### 1\. crash_detection.cfg - INTELLIGENT ERROR DETECTION

<details>
<summary>VARIABLES_LIST</summary>
  
```
[gcode_macro VARIABLES_LIST]
variable_tools:[0,1]
variable_active_tool:-1
variable_tc_state:0 #-1:Error, 0: Operational
variable_tc_error_code:0 # 0: No Error, 1: No Tool Attached to Carriage, 2: Tool Dock Failure, 3: Multiple Tools Attached  
variable_global_z_offset:0
variable_error_tools:[]
variable_t0_used_in_print:0
variable_t1_used_in_print:0
variable_print_status:0
variable_current_layer:0
variable_current_bed_temp:0
variable_pause_type:0 # 0: No Error, 1:ToolChanger Error 2: Filament Error

gcode:
```

</details>


<details><summary>_EVALUATE_MACHINE_STATE_QUICK</summary>
  
```
  testing
```

</details>

