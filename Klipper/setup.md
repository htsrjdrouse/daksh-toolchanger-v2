# Set up procedure #

First, check if the TC and TD are wired correctly (TC is tool coupling and TD is tool dock). It should look like this:

<img width="423" alt="sensor_test_working" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/89826b7d-b939-4dc2-8606-b5d9a6bad4dd">

And in this case, the LEDs are both on:

<img width="969" alt="both_tool_leds_on" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/ab1f434c-be3e-49c1-9f4c-fd919c71540a">



Then just run, CALC_DOCK_LOCATION tool=0 and CALC_DOCK_LOCATION tool=1, with the pins inside the dock (leave as is). It works with needing to remove the. Rather then using DOCK_TEST, you can run some gcode like this:

<code>
G1 X100 Y200 F8000
T0
M400
G1 X100 Y200 F8000
M400
KTCC_TOOL_DROPOFF_ALL
M400
G1 X100 Y200 F8000
T1
M400
G1 X100 Y200 F8000
M400
KTCC_TOOL_DROPOFF_ALL
M400
</code>


