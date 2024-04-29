### printer.cfg

```
[include mainsail.cfg]
```

<details><summary>mcu</summary>

```
[mcu]
serial: /dev/serial/by-id/usb-Klipper_stm32f446xx_15000E001250335331383820-if00
```
</details>

<details><summary>force_move</summary>

``` 
[force_move]
enable_force_move: True
```
</details>

<details><summary>printer</summary>

``` 

[printer]
kinematics: corexy
max_velocity: 300
max_accel: 3300 #10000                         #Max 4000
max_accel_to_decel: 3300 #10000 #3200                         #Max 4000
max_z_velocity: 15
max_z_accel: 50
square_corner_velocity: 5.0

```
</details>


#####################################################################
#       X/Y Stepper Settings
#####################################################################

<details><summary>stepper_x</summary>

``` 
[stepper_x]
##  B Stepper - Left
##      Connected to MOTOR_0
##  Endstop connected to DIAG_0
step_pin: PF13
dir_pin: PF12
enable_pin: !PF14
rotation_distance: 40
microsteps: 16
full_steps_per_rotation:400  #set to 400 for 0.9 degree stepper
endstop_pin: PG6
position_min: 0
position_endstop: 350
position_max: 350
       
##--------------------------------------------------------------------
homing_speed: 25   #Max 100
homing_retract_dist: 5
homing_positive_dir: true

```
</details>

<details><summary>tmc2209 stepper_x</summary>

``` 

##      Make sure to update below for your relevant driver (2208 or 2209)
[tmc2209 stepper_x]
uart_pin: PC4
interpolate: True
run_current: 1.05 #0.9
hold_current: 0.7
sense_resistor: 0.110
stealthchop_threshold: 0

```
</details>

<details><summary>stepper_y</summary>

``` 


[stepper_y]
##  A Stepper - Right
##  Connected to MOTOR_1
##  Endstop connected to DIAG_1
step_pin: PG0
dir_pin: PG1
enable_pin: !PF15
rotation_distance: 40
microsteps: 16
full_steps_per_rotation:400  #set to 400 for 0.9 degree stepper
endstop_pin: PG9
position_min: 0
position_endstop: 0
position_max: 550
homing_speed: 25  #Max 100
homing_retract_dist: 5
homing_positive_dir: false

```
</details>

<details><summary>tmc2209 stepper_y</summary>

``` 


##      Make sure to update below for your relevant driver (2208 or 2209)
[tmc2209 stepper_y]
uart_pin: PD11
interpolate: True
run_current: 1.05 #0.9
hold_current: 0.7
sense_resistor: 0.110
stealthchop_threshold: 0

```
</details>

<details><summary>stepper_z</summary>

``` 

#####################################################################
#       Z Stepper Settings
#####################################################################

## Z0 Stepper - Left Z Motor
## Z Stepper Socket
##  Endstop connected to DIAG_2
[stepper_z]
step_pin: PF11
dir_pin: !PG3
enable_pin: !PG5
homing_positive_dir: false
# Rotation Distance for TR8x8 = 8, TR8x4 = 4, TR8x2 = 2
rotation_distance: 4
microsteps: 32
full_steps_per_rotation: 200    #200 for 1.8 degree, 400 for 0.9 degree
endstop_pin: PG10
## All builds use same Max Z
position_max: 250
position_min: -2.5
position_endstop = -0.050
##--------------------------------------------------------------------
homing_speed: 8.0 # Leadscrews are slower than 2.4, 10 is a recommended max.
second_homing_speed: 3
homing_retract_dist: 3

```
</details>

<details><summary>tmc2209 stepper_z</summary>

``` 


##      Make sure to update below for your relevant driver (2208 or 2209)
[tmc2209 stepper_z]
uart_pin: PC6
interpolate: true
run_current: 0.8
hold_current: 0.5
sense_resistor: 0.110
stealthchop_threshold: 0

```
</details>

<details><summary>stepper_z1</summary>

``` 


##      Z1 Stepper - Rear Z Motor
##      E0 Stepper Socket
[stepper_z1]
step_pin: PG4
dir_pin: !PC1
enable_pin: !PA0
## Remember to mirror these changes in stepper_z and stepper_z2! (there are three motors)
rotation_distance: 4
microsteps: 32
full_steps_per_rotation: 200    #200 for 1.8 degree, 400 for 0.9 degree

```
</details>

<details><summary>tmc2209 stepper_z1</summary>

``` 

##      Make sure to update below for your relevant driver (2208 or 2209)
[tmc2209 stepper_z1]
uart_pin: PC7
interpolate: true
run_current: 0.8
hold_current: 0.5
sense_resistor: 0.110
stealthchop_threshold: 0

```
</details>

<details><summary>stepper_z2</summary>

``` 


##      Z2 Stepper - Right Rear Z Motor
##      E1 Stepper Socket
[stepper_z2]
step_pin: PF9
dir_pin: PF10
enable_pin: !PG2
## Remember to mirror these changes in stepper_z and stepper_z1! (there are three motors)
rotation_distance: 4
microsteps: 32
full_steps_per_rotation: 200    #200 for 1.8 degree, 400 for 0.9 degree

```
</details>

<details><summary>tmc2209 stepper_z2</summary>

``` 


[tmc2209 stepper_z2]
uart_pin: PF2
interpolate: true
run_current: 0.8
hold_current: 0.5
sense_resistor: 0.110
stealthchop_threshold: 0

```
</details>

<details><summary>probe</summary>

``` 


[probe]
pin: PG12
x_offset: 0
y_offset: 25.0
z_offset: -3
speed: 10.0
samples: 3
samples_result: median
sample_retract_dist: 3.0
samples_tolerance: 0.006
samples_tolerance_retries: 3


```
</details>

<details><summary>heater_bed</summary>

``` 

#####################################################################
#   Bed Heater
#####################################################################

[heater_bed]
heater_pin: PA1
sensor_type: Generic 3950
sensor_pin: PF3
max_power: 0.6
min_temp: 0
max_temp: 120
control: pid
pid_kp: 58.437
pid_ki: 2.347
pid_kd: 363.769


```
</details>

<details><summary>homing_override</summary>

``` 

#####################################################################
#   Homing override
#####################################################################


[homing_override]
axes: xyz
gcode:
    {% set home_all = 'X' not in params and 'Y' not in params and 'Z' not in params %}
    {% if home_all or 'Y' in params %}
        G28 Y
    {% endif %}
    {% if home_all or 'X' in params %}
        G28 X
    {% endif %}
    G0 X103 Y334 F6000
    {% if home_all or 'Z' in params %}
        G28 Z
    {% endif %}

```
[include toolchanger.cfg]
```

```
</details>

<details><summary>z_tilt</summary>

``` 

[z_tilt]
z_positions:
    -50, 340
    405,340
    405,-24
points:
       40, 5
       165, 265
       290, 5
speed: 300
horizontal_move_z: 10
retries: 5
retry_tolerance: 0.01250

```
</details>

<details><summary>bed_mesh</summary>

``` 

[bed_mesh]
speed: 300
horizontal_move_z: 5
mesh_min: 30,20
mesh_max: 290,265
fade_end: 10.0
probe_count: 5,5
algorithm: bicubic
zero_reference_position:150,150
#relative_reference_index: 12

```
</details>

```
[include macros.cfg]
```

#*# <---------------------- SAVE_CONFIG ---------------------->
#*# DO NOT EDIT THIS BLOCK OR BELOW. The contents are auto-generated.
#*#
