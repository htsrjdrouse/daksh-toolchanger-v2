
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
  [gcode_macro _EVALUATE_MACHINE_STATE_QUICK]
gcode:
  {% set allTools = printer["gcode_macro VARIABLES_LIST"].tools %}
  {% set activeTools = [] %}
  {% set accountedTools = [] %}

  #M118 "--->_EVALUATE_MACHINE_STATE_QUICK"
  {% for tool in allTools %}

          #We do both hall effects individually to catch the case where carriage is sitting flush with a tool while it is still in dock
          {% if printer["atc_switch tc"~tool].state == "PRESSED" %}
                  {activeTools.append(tool|int)}
                  {accountedTools.append(tool)}
          {% endif %}
          {% if printer["atc_switch td"~tool].state == "PRESSED" %}
                        {accountedTools.append(tool)}
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

</details>

