## Pause resume 


<details><summary>SET_PAUSE_TYPE</summary>

```
[gcode_macro SET_PAUSE_TYPE]
gcode:
        SET_GCODE_VARIABLE MACRO=VARIABLES_LIST VARIABLE=pause_type VALUE={params.TYPE}
```

</details>


<details><summary>RESET_PAUSE_TYPE</summary>

```
[gcode_macro RESET_PAUSE_TYPE]
gcode:
        SET_GCODE_VARIABLE MACRO=VARIABLES_LIST VARIABLE=pause_type VALUE=0

```
</details>

<details><summary>PAUSE</summary>

```
[gcode_macro PAUSE]
rename_existing: BASE_PAUSE
gcode:
  #{% if printer.pause_resume.is_paused %}
#       M118 "Print Already Paused"
#  {% else %}
   SAVE_GCODE_STATE NAME=PAUSE_state
   BASE_PAUSE
   G91
   G1 Z5 F3000
   G90
   RSCS_off
 # {% endif %}
```

</details>


<details><summary>RESUME</summary>


```
[gcode_macro RESUME]
rename_existing: BASE_RESUME
gcode:
  {% if printer.pause_resume.is_paused %}
        {% if printer["gcode_macro VARIABLES_LIST"].tc_state == 0 %}
                G91
                {% if printer["gcode_macro VARIABLES_LIST"]["print_status"]|int == 1 %}
                        {% if printer["gcode_macro VARIABLES_LIST"]["pause_type"]|int == 1%}
                                PREPARE_TOOL_BEFORE_RESUME
                        {% endif %}
                {% endif %}
                RESTORE_GCODE_STATE NAME=PAUSE_state
                BASE_RESUME
                VERIFY_TOOLCHANGE_DURING_PRINT DURATION=5 FORCE=1
                SAVE_GCODE_STATE NAME=PAUSE_state
                RSCS_LAYER_CHECK LAYER={printer["gcode_macro VARIABLES_LIST"].current_layer}
                RESET_PAUSE_TYPE
                ;SET_STATUS_LED_LOCK T={printer["gcode_macro VARIABLES_LIST"].active_tool}
                ;SET_ENCLOSURE_DEFAULT
                M117 ""
        {% else %}
                M118 "Printer in Error State - Cannot Resume Print"
        {% endif %}
  {% endif %}

```

</details>
