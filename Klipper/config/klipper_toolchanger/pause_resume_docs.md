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


