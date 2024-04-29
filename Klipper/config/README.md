
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

<details><summary>_EVALUATE_MACHINE_STATE</summary>

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
                {activeTools.append(tool|int)}
                {accountedTools.append(tool|int)}
        {% endif %}

        #Find All Tools attached to the docks - should be maximum num tools               
        {% if printer["atc_switch td"~tool].state == "PRESSED" %}
                {dockedTools.append(tool|int)}
                {accountedTools.append(tool|int)}
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
                                {errorTools.append(tool)}
                        {% endfor %}

                        SET_GCODE_VARIABLE MACRO=VARIABLES_LIST VARIABLE=tc_state VALUE=-1
                        SET_GCODE_VARIABLE MACRO=VARIABLES_LIST VARIABLE=tc_error_code VALUE=1

                  {% else %}
                        {% if activeTools|length > 1 %}

                                {% set allToolsTemp = allTools %}
                                M118 "Multiple Tools Showing up as attached to carriage"

                                {% for tool in activeTools %}
                                        {% if printer["atc_switch tc"~tool].state == "PRESSED" and printer["atc_switch td"~tool].state == "PRESSED" %}
                                                {errorTools.append(tool)}
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
                                                        {errorTools.append(dockedToolsTemp.pop(dockedToolsTemp.index(tool)))}
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
                                                                        {errorTools.append(tool)}
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
                        ;SET_STATUS_LED_LOCK T={tool}
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

          ;SET_ENCLOSURE_DEFAULT  

  {% endif %}


```
  
</details>

<details><summary>_SET_CURRENT_TOOL</summary>

```
[gcode_macro _SET_CURRENT_TOOL]
gcode:
        SAVE_CURRENT_TOOL T={params.T}
        {% if params.T|int > -1 %}
                ;SET_ACTIVE_TOOL_PROBE T={params.T}
                {% if params.T|int > 0 %}
                        ACTIVATE_EXTRUDER EXTRUDER=extruder{params.T}
                {% else %}
                        ACTIVATE_EXTRUDER EXTRUDER=extruder
                {% endif %}
                {% if 't0_x_offset' not in printer.save_variables.variables %}
                        {%set offset_x =  0 %}
                        {%set offset_y =  0 %}
                        {%set offset_z = 0 %}
                {% else %}
                        {% set offset_x =  printer.save_variables.variables['t'~params.T~'_x_offset']|float%}
                        {% set offset_y =  printer.save_variables.variables['t'~params.T~'_y_offset']|float%}
                        {% if params.T|int > 0 %}
                                {%set offset_z =  printer.save_variables.variables['t0_z_offset']|float + printer.save_variables.variables['t'~params.T~'_z_offset']|float%}
                        {% else %}
                                {%set offset_z =  printer.save_variables.variables['t'~params.T~'_z_offset']|float %}
                        {% endif %}
                {% endif %}
                #M118 T{params.T}
                #M118 OFFSET X: {offset_x}
                #M118 OFFSET Y: {offset_y}
                #M118 OFFSET Z: {offset_z}

                {% if printer.toolhead.homed_axes !="xyz" %}
                        SET_KINEMATIC_POSITION X=160 Y=160 Z=100
                {% endif %}

                SET_GCODE_OFFSET X={offset_x|float} Y={offset_y|float} Z={offset_z|float} MOVE=1

        {% endif %}

```
  
</details>

#### Tool Management For Current Print

<details><summary>GET_TOOLS_FOR_PRINT</summary>


```
[gcode_macro GET_TOOLS_FOR_PRINT]
gcode:
        {% set allTools = printer["gcode_macro VARIABLES_LIST"].tools %}
        {% set toolsforprint= [] %}
        {% for tool in allTools %}
                {% if printer["gcode_macro VARIABLES_LIST"]["t"~tool~"_used_in_print"]|int == 1%}
                        {toolsforprint.append(tool)}
                {% endif %}
        {% endfor %}
        #M118 Tools Used In Current Print: {toolsforprint}
```


</details>

<details><summary>RESET_TOOLS_FOR_PRINT</summary>

```
[gcode_macro RESET_TOOLS_FOR_PRINT]
gcode:
  {% set allTools = printer["gcode_macro VARIABLES_LIST"].tools %}
  {% for tool in allTools %}
          SET_GCODE_VARIABLE MACRO=VARIABLES_LIST VARIABLE=t{tool}_used_in_print VALUE=0
  {% endfor %}
```

</details>

<details><summary>SET_TOOL_FOR_PRINT</summary>

```
[gcode_macro SET_TOOL_FOR_PRINT]
gcode:
        SET_GCODE_VARIABLE MACRO=VARIABLES_LIST VARIABLE=t{params.T}_used_in_print VALUE=1
        {% if params.R is defined and params.S is defined%}
                M568 P{params.T} R{params.R} S{params.S} A0
        {% endif %}
```
  
</details>

  
