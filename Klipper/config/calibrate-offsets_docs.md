

<details><summary>tools_calibrate</summary>

```
[tools_calibrate]
pin: PG12
travel_speed: 100
spread: 7
lower_z: 1.0
# The speed (in mm/sec) to move tools down onto the probe
speed: 1
# The speed (in mm/sec) to retract between probes
lift_speed: 4
final_lift_z: 6
samples:3
samples_result: median # median, average
sample_retract_dist:3
samples_tolerance:0.02
samples_tolerance_retries:3
# Decrease -> higher nozzle
trigger_to_bottom_z: 3
```
</details>

<details><summary>CALIBRATE_MOVE_OVER_PROBE</summary>

```
[gcode_macro _CALIBRATE_MOVE_OVER_PROBE]
gcode:
    BED_MESH_CLEAR
    G0 Z62 F10000
    G0 X342.5 Y18.5 F10000
```
</details>

<details><summary>CALIBRATE_MOVE_OVER_PROBE</summary>

```
[gcode_macro _CALIBRATE_MOVE_OVER_PROBE_PARAMS]
    gcode:
        BED_MESH_CLEAR
        G0 Z63 F10000
        G0 X{params.Y} Y{params.Y} F10000
```
</details>

<details><summary>CALIBRATE_TOOL_OFFSETS</summary>

```
[gcode_macro CALIBRATE_TOOL_OFFSETS]
gcode:
    {% set tools = [0,1,2,3,4] %}
    T_1
    T{tools[0]}
    _CALIBRATE_MOVE_OVER_PROBE    
    TOOL_LOCATE_SENSOR
    
    {% for tool in tools[1:] %}
        M118 T{tool} Offset Calculation Begin
        T{tool}
        _CALIBRATE_MOVE_OVER_PROBE
        TOOL_CALIBRATE_TOOL_OFFSET
        TOOL_CALIBRATE_SAVE_TOOL_OFFSET ATTRIBUTE="t{tool}_x_offset" VALUE="{% raw %}{x:0.6f}{% endraw %}"
        TOOL_CALIBRATE_SAVE_TOOL_OFFSET ATTRIBUTE="t{tool}_y_offset" VALUE="{% raw %}{y:0.6f}{% endraw %}"
        TOOL_CALIBRATE_SAVE_TOOL_OFFSET ATTRIBUTE="t{tool}_z_offset" VALUE="{% raw %}{z:0.6f}{% endraw %}"
        M118 T{tool} Offset Calculation End
    {% endfor %}
    
    T{tools[0]}

```
</details>

<details><summary>CALIBRATE_TOOL_OFFSETS</summary>

```    
[gcode_macro CALIBRATE_TOOL_OFFSETS]
    gcode:

        G32                
        {% for iteration in range(25) %}
            G28
            _CALIBRATE_MOVE_OVER_PROBE    
            TOOL_LOCATE_SENSOR
        {% endfor %}

```
</details>

<details><summary>_PICK_TOOL_AND_LOCATE_SENSOR</summary>

```    
[gcode_macro _PICK_TOOL_AND_LOCATE_SENSOR]
        gcode:
            T_1
            T{params.T}
            _CALIBRATE_MOVE_OVER_PROBE    
            TOOL_LOCATE_SENSOR
            T_1
```
</details>


<details><summary>CHECK_TOOL_REPEATABILITY</summary>

```    
[gcode_macro CHECK_TOOL_REPEATABILITY]
    gcode:
    
        G32  
        {% for iteration in range(5) %}
            T{params.T}
            _CALIBRATE_MOVE_OVER_PROBE    
            TOOL_LOCATE_SENSOR
            KTCC_TOOL_DROPOFF_ALL
        {% endfor %}
```
</details>

<details><summary>CALIBRATE_OFFSETS_TEST</summary>

```    
[gcode_macro CALIBRATE_OFFSETS_TEST]
    gcode:
    
        G32
    
        {% set cal_loop = [0,1,2,3,4,5] %}
        {% set tools = [0,1] %}
        
        {% for iteration in range(25)%}
        
            T{tools[0]}
            _CALIBRATE_MOVE_OVER_PROBE    
            TOOL_LOCATE_SENSOR
            
            {% for tool in tools[1:] %}
                T{tool}
                _CALIBRATE_MOVE_OVER_PROBE
                TOOL_CALIBRATE_TOOL_OFFSET
                TOOL_CALIBRATE_SAVE_TOOL_OFFSET ATTRIBUTE="i{iteration}_t{tool}_x_offset" VALUE="{% raw %}{x:0.6f}{% endraw %}"
                TOOL_CALIBRATE_SAVE_TOOL_OFFSET ATTRIBUTE="i{iteration}_t{tool}_y_offset" VALUE="{% raw %}{y:0.6f}{% endraw %}"
                TOOL_CALIBRATE_SAVE_TOOL_OFFSET ATTRIBUTE="i{iteration}_t{tool}_z_offset" VALUE="{% raw %}{z:0.6f}{% endraw %}"
            {% endfor %}
        {% endfor %}
        
        T{tools[0]}
```
</details>

<details><summary>CALIBRATE_ONE_OFFSET</summary>


```    
[gcode_macro CALIBRATE_ONE_OFFSET]
gcode:
    {% set tools = printer.toolchanger.tool_numbers %}
    {% set names = printer.toolchanger.tool_names %}
    # Tool 0
    SELECT_TOOL T=0  RESTORE_AXIS=XYZ
    STOP_TOOL_PROBE_CRASH_DETECTION
    _CLEAN_NOZZLE TEMP=220
    _CALIBRATE_MOVE_OVER_PROBE    
    M104 S150
    TOOL_LOCATE_SENSOR
    M104 S0
    SELECT_TOOL T={params.TOOL}  RESTORE_AXIS=Z
    STOP_TOOL_PROBE_CRASH_DETECTION
    _CLEAN_NOZZLE TEMP=220
    M104 S150 T{params.TOOL}
    _CALIBRATE_MOVE_OVER_PROBE    
    TOOL_CALIBRATE_TOOL_OFFSET
    TOOL_CALIBRATE_PROBE_OFFSET PROBE="tool_probe T{params.TOOL}"
    M104 S0
    
    # Finish up
    SELECT_TOOL T=0 RESTORE_AXIS=XYZ
```
</details>


<details><summary>CALIBRATE_NOZZLE_PROBE_OFFSET</summary>


```
[gcode_macro CALIBRATE_NOZZLE_PROBE_OFFSET]
gcode:
    STOP_TOOL_PROBE_CRASH_DETECTION
    _CLEAN_NOZZLE TEMP=220
    _CALIBRATE_MOVE_OVER_PROBE
    M104 S150
    TEMPERATURE_WAIT SENSOR='{printer.toolhead.extruder}' MINIMUM=150
    TOOL_LOCATE_SENSOR
    TOOL_CALIBRATE_PROBE_OFFSET PROBE="tool_probe T0"
    M104 S0
```

</details>

<details><summary>TEST_TOOL_OFFSET</summary>

```    
[gcode_macro TEST_TOOL_OFFSET]
gcode:
    T_1
    T{params.T}
    SET_GCODE_OFFSET X_ADJUST={params.OFFSET_X|float} Y_ADJUST={params.OFFSET_Y|float} Z={params.OFFSET_Z|float}
    G1 X{params.X} Y{params.Y} Z{params.Z} F10000

```
</details>
