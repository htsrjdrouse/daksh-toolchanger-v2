
<details><summary>TOOL_DROPOFF</summary>

```
[gcode_macro TOOL_DROPOFF]
gcode:
  KTCC_TOOL_DROPOFF_ALL
```

</details>

<details><summary>SAVE_ACCELERATION</summary>

```
[gcode_macro SAVE_ACCELERATION]
variable_max_accel: 0
gcode:
  SET_GCODE_VARIABLE MACRO=SAVE_ACCELERATION VARIABLE=max_accel VALUE={printer.toolhead.max_accel}
</details>

<details><summary>RESTORE_ACCELERATION</summary>

```
[gcode_macro RESTORE_ACCELERATION]
gcode:
  {% if printer['gcode_macro SAVE_ACCELERATION'].max_accel|int == 0 %}
	{ action_respond_info("RESTORE_ACCELERATION: No acceleration saved.") }
  {% else %}
	M204 S{printer['gcode_macro SAVE_ACCELERATION'].max_accel}
  {% endif %}
```
</details>
