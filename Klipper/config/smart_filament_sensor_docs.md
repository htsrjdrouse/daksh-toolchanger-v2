### smart_filament_sensors.cfg 

This works with smart filament sensor: https://www.printables.com/model/489791-smart-filament-sensor

You can define for each tool. 

<details><summary>filament_motion_sensor encoder_t0</summary>

```
[filament_motion_sensor encoder_t0]
detection_length: 10
extruder: extruder
#switch_pin: ^!PE4
switch_pin: ^!EBB0: PB5
pause_on_runout: false
runout_gcode: FILAMENT_ISRUNOUT
```

</details>


<details><summary>filament_motion_sensor encoder_t1</summary>

```
[filament_motion_sensor encoder_t1]
detection_length: 10
extruder: extruder1
#switch_pin: ^!PE4
switch_pin: ^!EBB1: PB5
pause_on_runout: false
runout_gcode: FILAMENT_ISRUNOUT
```

</details>


<details><summary>gcode_macro FILAMENT_ISRUNOUT</summary>

```
[gcode_macro FILAMENT_ISRUNOUT]
description: Is called when filament runout is detected by filament_motion_sensor
gcode:
 {% set runout_state = "delay_runout_check" if printer.print_stats.print_duration < 30 else "runout" %}
 {% set runout_state = "not_printing" if printer.idle_timeout.state != "Printing" else "runout" %}
 # {% set runout_state = "nope" if 1 == 2 else "runout" %}
 {% set counter = printer["gcode_macro cfgs"].counter + 1 %}
 SET_GCODE_VARIABLE MACRO=cfgs VARIABLE=counter VALUE='{counter}'
 # { action_respond_info("counter: %i" % (counter)) }
 { action_respond_info("runout state: %s" % (runout_state)) }
 {% if runout_state == "delay_runout_check" %} 
     { action_respond_info("No runout detection first 30 seconds of print duration.") }
 {% elif runout_state == "not_printing" %}
     ## Printer not in printing state
     { action_respond_info("No runout detection as printer is not in printing state.") }
 {% else %}
       {% set breaker = namespace(found=False) %}
       {% if runout_state == "runout" %}
           {% if counter < 4 %}
               UPDATE_DELAYED_GCODE ID=RECHECK_FILAMENT_ISRUNOUT DURATION=5 ; Recheck after XXs duration
               { action_respond_info("Detected possible runout. Recheck runout sensor in 5s.") }
           {% else %}
               SET_GCODE_VARIABLE MACRO=cfgs VARIABLE=counter VALUE='0'
               { action_respond_info("Detected actual runout. Go to filament change position.") }
               M600 ; Go To Filament Change position
              {% set breaker.found = true %}
           {% endif %} 
       {% endif %} 
 {% endif %}
```
</details>

<details><summary>delayed_gcode RECHECK_FILAMENT_ISRUNOUT</summary>

```
[delayed_gcode RECHECK_FILAMENT_ISRUNOUT]             
gcode:
    {% set rechecks = printer["gcode_macro cfgs"].rechecks %}
    {% set rechecks=rechecks+1 %}
    SET_GCODE_VARIABLE MACRO=cfgs VARIABLE=rechecks VALUE='{rechecks}'
    {% if printer["filament_motion_sensor filament_sensor"].filament_detected == True %}
        { action_respond_info("filament found, total rechecks: %i"  % (rechecks | int)) }
        SET_GCODE_VARIABLE MACRO=cfgs VARIABLE=counter VALUE='0'
    {% else %}
         { action_respond_info("no filament detected, total rechecks: %i"  % (rechecks | int)) }
        FILAMENT_ISRUNOUT
    {% endif %}
```
</details>

<details><summary>gcode_macro cfgs</summary>

```
[gcode_macro cfgs]
variable_counter: 0
variable_rechecks: 0
gcode:
      { action_respond_info("var is loaded.") } 
```
</details>

<details><summary>delayed_gcode SETFILAMENTSENSOR_ON</summary>

``` 
[delayed_gcode SETFILAMENTSENSOR_ON]
gcode:
  {% if params.T|int > 0 and params.T|int < 5 %}
 	#SET_FILAMENT_SENSOR SENSOR=filament_sensor ENABLE=1
 	SET_FILAMENT_SENSOR SENSOR=encoder_t{params.T} ENABLE=1
  {% endif %}
```
</details>


<details><summary>delayed_gcode SETFILAMENTSENSOR_OFF</summary>

``` 
[delayed_gcode SETFILAMENTSENSOR_OFF]
gcode:
  {% if params.T|int > 0 and params.T|int < 5 %}
 	#SET_FILAMENT_SENSOR SENSOR=filament_sensor ENABLE=1
 	SET_FILAMENT_SENSOR SENSOR=encoder_t{params.T} ENABLE=0
  {% endif %}
```
</details>

