##Testing loading accuracy##

I wanted to see how accurate the loading and unloading is and used the nudge tool (https://github.com/zruncho3d/nudge/tree/main). When first using this tool, I made some mistakes first I installed it upside down then maybe I didn't tighten the screws sufficiently to get a good electrical connection. I ended up having to tweak a few settings from what is recommended in the github, not entirely sure its necessary. 

Here are my settings for the nudge tool (found in calibrate-offsets.cfg):


```
[tools_calibrate]
pin: ^PG11
travel_speed: 10#10#75
spread: 8 #8
lower_z: 0.5 #0.5 #1.0
lift_z: 2
# The speed (in mm/sec) to move tools down onto the probe
speed: 2.5 #5 #1
# The speed (in mm/sec) to retract between probes
lift_speed: 1 #4 #1
final_lift_z: 4 #6
samples: 1 #3 #3
samples_result: median # median, average
sample_retract_dist:5
samples_tolerance: 0.05 #0.5 #2 #0.02
# samples_tolerance_retries:3
# Decrease -> higher nozzle
trigger_to_bottom_z: 3 #0.5
```

Also for the loading and unloading of the tools, here are my settings in toollock (found in toolchanger.cfg):

```
[toollock]
purge_on_toolchange = False          # Here we can disable all purging. When disabled it overrides all other purge options. Defaults to true. This can be turned off by a macro for automatic probing hot tools without probing them. For example when doing TAMV or ZTATP.
init_printer_to_last_tool = True   #Initialise as it was turned off, unlock tool if none was loaded or lock if one was loaded. Defaults to True
tool_lock_gcode:
  SAVE_GCODE_STATE NAME=tool_unlock_state                                         # Save gcode state
   G91 
   G4 P2000  # Dwell for 2 seconds (2000 milliseconds)
   G1 X-14 F{printer.save_variables.variables['ktcc_dock_move_speed']|int}
   M400
   RESTORE_GCODE_STATE NAME=tool_unlock_state MOVE=0                               # Restore gcode state
  
tool_unlock_gcode:
  SAVE_GCODE_STATE NAME=tool_lock_state                                           # Save gcode state
   G91 
   G1 X14 F{printer.save_variables.variables['ktcc_dock_move_speed']|int}
   M400
  RESTORE_GCODE_STATE NAME=tool_lock_state MOVE=0                                 # Restore gcode state
```

And for my speed settings which are located in variables.cfg:

```
[Variables]
ktcc_dock_move_speed = 4000
ktcc_speed1 = 6000
ktcc_speed2 = 500
ktcc_speed3 = 2000
```

I ran the NUDGE_FIND_TOOL_OFFSETS to get the offset measurements after here are the readings:

```
read1 = "Tool offset is 0.481250,-0.368750,-0.000000"
read2 = "Tool offset is 0.485937,-0.254688,0.022500"
read3 = "Tool offset is 0.492187,-0.260938,0.007500" 
read4 = "Tool offset is 0.490625,-0.348438,-0.009375"
read5 = "Tool offset is 0.460937,-0.253125,0.034375"
read6 = "Tool offset is 0.448437,-0.340625,0.010625"
```


For the x my average is 0.4765621666666666 and %CV is 3.41%
For the y my average is -0.3044273333333333 and %CV is 16.08%
For the z my average is 0.010937500 and %CV is 130.76%

This is a bit high and so there probably needs to be more tension in the springs. 

<img width="452" alt="toollock_loose" src="https://github.com/user-attachments/assets/fe104ca7-342a-4b67-b36e-456d99e02096">

So the springs were tightened and the test was rerun. 

```
read1 = "Tool offset is -1.470312,-0.817187,0.258750"
read2 = "Tool offset is -1.468750,-0.803125,0.263750"
read3 = "Tool offset is -1.471875,-0.810937,0.185000"
```

For the x my average is -1.470312 and %CV is 0.1062%

For the y my average is -0.81041 and %CV is 0.8699%

For the z my average is 0.23583 and %CV is 18.7035%


The nudge tool works well if you use copper screws and if you want to know how accurate the loading and unloading is. However, when printing with these recommended offsets, this is wrong.

<img width="487" alt="nudge_recommended_offsets" src="https://github.com/user-attachments/assets/556da92f-a465-49a8-af59-521363d75e6d">

I ended up having to print a calibration tower to figure out the offsets. For this tower, I ended up having the following offsets, t1_offset = (-3.2, -0.81041, 0.23583). So its just the x offset where there is big changes. But the y offset also needs to be adjusted slightly which I still need to do. I think the y offset probably needs to be adjust to -0.61 (200 microns less) 


