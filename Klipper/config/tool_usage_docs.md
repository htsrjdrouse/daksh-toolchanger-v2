#######################
# TOOL_USAGE_COUNT _ Used to determine first usage of a tool for purge purposes
#######################


<details><summary>TOOL_USE_COUNT</summary>

```  
[gcode_macro TOOL_USE_COUNT]
variable_t0_use_count:0
variable_t1_use_count:0
variable_total_use_count:0
variable_current_nozzle_prime:0
gcode:
```

</details>

<details><summary>INITIALIZE_TOOL_USE_COUNT</summary>

```

[gcode_macro INITIALIZE_TOOL_USE_COUNT]
gcode:
        SET_GCODE_VARIABLE MACRO=TOOL_USE_COUNT VARIABLE=t0_use_count VALUE=0
        SET_GCODE_VARIABLE MACRO=TOOL_USE_COUNT VARIABLE=t1_use_count VALUE=0
        SET_GCODE_VARIABLE MACRO=TOOL_USE_COUNT VARIABLE=total_use_count VALUE=0
        SET_GCODE_VARIABLE MACRO=TOOL_USE_COUNT VARIABLE=current_nozzle_prime VALUE=0

```

</details>

<details><summary>INCREMENT_TOOL_USE_COUNT</summary>

```
[gcode_macro INCREMENT_TOOL_USE_COUNT]
gcode:
        #{% if printer.idle_timeout.state != "Printing" %}
                SET_GCODE_VARIABLE MACRO=TOOL_USE_COUNT VARIABLE=t{params.T}_use_count VALUE={printer["gcode_macro TOOL_USE_COUNT"]['t'~params.T~'_use_count']|int + 1}
                SET_GCODE_VARIABLE MACRO=TOOL_USE_COUNT VARIABLE=total_use_count VALUE={printer["gcode_macro TOOL_USE_COUNT"]['total_use_count']|int + 1}
        #{% endif %}

```

</details>

<details><summary>GET_TOOL_USE_COUNTS</summary>

```

[gcode_macro GET_TOOL_USE_COUNTS]
gcode:

        M118 TOOL CHANGE COUNTS::
        M118 T0 - {printer["gcode_macro TOOL_USE_COUNT"]['t0_use_count']}
        M118 T1 - {printer["gcode_macro TOOL_USE_COUNT"]['t1_use_count']}
        M118 TOTAL - {printer["gcode_macro TOOL_USE_COUNT"]['total_use_count']}
```

</details>
~  
