
<h2>Gcode files relevant to the Dakash toolchanger system</h2>

These files located in ~/printer_data/config/


### 2\. Validate your mmu_hardware.cfg configuration and basic operation

Generally the typical "Type-A" MMU will consist of selector motor to position at the desired gate, a gear motor to drive the filament to the extruder and a servo to grip and release the filament. In addition there may be a one or more sensors (endstops) to aid filament positioning. See [hardware configuration doc](/doc/hardware_config.md) for detailed instructions and consult [MMU conceptual model](/doc/conceptual_mmu.md) for details of less common MMU types.

<details>
<summary><sub>🔹 Details on optional hardware...</sub></summary>

#### Optional hardware - Encoder

Happy Hare supports the use of an encoder which is fundamental to the ERCF MMU design. This is a device that measures the movement of filament and can be used for detecting and loading/unloading filament at the gate; validating that slippage is not occurring; runout and clog detection; flow rate verification and more. The following is an output of the `MMU_ENCODER` command to control and view the encoder:

> MMU_ENCODER ENABLE=1<br>MMU_ENCODER

```
    Encoder position: 743.5mm
    Clog/Runout detection: Automatic (Detection length: 10.0mm)
    Trigger headroom: 8.3mm (Minimum observed: 5.6mm)
    Flowrate: 0 %
```

Normally the encoder is automatically enabled when needed and disabled when not printing. To see the extra information, you need to temporarily enable if out of a print (hence the extra `ENABLE=1` command).

<ul>
  <li>The encoder, when calibrated, measures the movement of filament through it.  It should closely follow movement of the gear or extruder steppers but can drift over time.</li>
  <li>If enabled the clog/runout detection length is the maximum distance the extruder is allowed to move without the encoder seeing it. 
 A difference equal or greater than this value will trigger the clog/runout logic in Happy Hare</li>
  <li>If clog detection is in `automatic` mode the `Trigger headroom` represents the distance that Happy Hare will aim to keep the clog detection from firing.  Generally around 6mm - 8mm is good starting point.</li>
  <li>The minimum observed headroom represents how close (in mm) clog detection came to firing since the last toolchange. This is useful for tuning your detection length (manual config) or trigger headroom (automatic config)</li>
<li>Finally the `Flowrate` will provide an averaged % value of the mismatch between extruder extrusion and measured movement. Whilst it is not possible for this to be real-time accurate it should average above 94%. If not it indicates that you may be trying too extrude too fast.</li>
</ul>

</details>



<details> <summary>crash_detection.cfg</summary> INTELLIGENT ERROR DETECTION
<details> <summary>VARIABLES_LIST</summary> 
 
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
</details> </details>

- crash_detection.cfg
- dock_calibrate.cfg
- filament_sensors.cfg
- klipper_toolchanger/M568.cfg
- klipper_toolchanger/M204.cfg
- klipper_toolchanger/misc.cfg
- klipper_toolchanger/toolchange_management.cfg
- klipper_toolchanger/M106.cfg
- klipper_toolchanger/M107.cfg
- klipper_toolchanger/M107.cfg
- klipper_toolchanger/M600.cfg
- klipper_toolchanger/M600.cfg
- klipper_toolchanger/G10.cfg
- klipper_toolchanger/M116.cfg
- klipper_toolchanger/pause_resume.cfg
- klipper_toolchanger/M566.cfg
- mainsail.cfg
- shell_command.cfg
- status_led.cfg
- toolchange_macros.cfg
- toolchanger.cfg
- tool_usage.cfg
