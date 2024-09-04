### filament_sensors.cfg 

This works with TCRT50000 Infrared reflective sensors. This example shows a set up for 2 tools


<details><summary>filament_motion_sensor encoder_t0</summary>

```
[filament_motion_sensor encoder_t0]
switch_pin: EBB0:PB6
detection_length: 10
extruder: extruder
pause_on_runout: True
insert_gcode:
runout_gcode:
 PAUSE_AND_ALERT_FILAMENT T=0 STATE=JAM
```

</details>


<details><summary>filament_motion_sensor encoder_t1</summary>

```
[filament_motion_sensor encoder_t1]
switch_pin: EBB1:PB5
detection_length: 10
extruder: extruder1
pause_on_runout: True
insert_gcode:
runout_gcode:
 PAUSE_AND_ALERT_FILAMENT T=1 STATE=JAM
```

</details>


<details><summary>TURN_ON_ALL_FILAMENT_SENSORS</summary>

```
[gcode_macro TURN_ON_ALL_FILAMENT_SENSORS]
gcode:
        SET_FILAMENT_SENSOR SENSOR=encoder_t0 ENABLE=1
        SET_FILAMENT_SENSOR SENSOR=encoder_t1 ENABLE=1
        M118 ENABLE ALL FILAMENT_SENSORS
```
</details>

<details><summary>TURN_OFF_ALL_FILAMENT_SENSORS</summary>

```                
[gcode_macro TURN_OFF_ALL_FILAMENT_SENSORS]
gcode:
        SET_FILAMENT_SENSOR SENSOR=encoder_t0 ENABLE=0
        SET_FILAMENT_SENSOR SENSOR=encoder_t1 ENABLE=0
        M118 DISABLE ALL FILAMENT_SENSORS
```
</details>

<details><summary>ENABLE_FILAMENT_SENSOR</summary>

```
[gcode_macro ENABLE_FILAMENT_SENSOR]
gcode:
  {% if params.T|int > 0 and params.T|int < 5 %}
         SET_FILAMENT_SENSOR SENSOR=runout_t{params.T} ENABLE=1
         SET_FILAMENT_SENSOR SENSOR=encoder_t{params.T} ENABLE=1
         M118 ENABLE FILAMENT SENSOR T{params.T}
  {% endif %}
```
</details>

<details><summary>PAUSE_AND_ALERT_FILAMENT</summary>

``` 
[gcode_macro PAUSE_AND_ALERT_FILAMENT]
gcode:
        M117 TOOLHEAD T{params.T} {params.STATE}
        SET_PAUSE_TYPE TYPE=2 # Set Pause Type to Filament
        SET_STATUS_LED_ERROR_START T={params.T}
        SET_ENCLOSURE_ERROR_START
        PAUSE
        #SEND_SLACK_MESSAGE MSG="FILAMENT ERROR DETECTED - PRINT PAUSED - PLEASE CHECK. T={params.T}}"
```
</details>
