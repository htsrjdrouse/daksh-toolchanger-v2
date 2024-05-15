# Set up procedure #

### Before, proceeding, you may see a problem like with the klipper_toolchanger repo being 'dirty'. That's a good thing. 

<img width="711" alt="dirty_repo" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/378d0a99-3bc3-437a-b78e-91e90d656a85">


### After installation and modifying the configuration to work with 2 tools instead of 5 initially, here are the operational steps to get the system running: ###

1. Run DOCK_TEST to get the system to find the docks, you may get an error like this:

<img width="1110" alt="doc_test_error" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/34f7820b-7765-4f95-99bd-23b52c98910f">

If this is the case, then you need to test the ATC switch buttons which are the hall sensors that detect the docks. In this case, we need to check both docks (dock0 - QUERY_ATCSWITCH BUTTON=tc0) (dock1 - QUERY_ATCSWITCH BUTTON=tc1). 

<img width="385" alt="dock1_test" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/de97417c-1f99-48fb-8896-21f02463b0e6">

Dock 0 - tests fine

<img width="385" alt="dock2_test" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/140b3a0c-c698-452e-826b-00cff503a48f">

Dock 1 - there is something wrong with the wiring (or sensor) for this one. In my case didn't use the correct pin. 

After toiling with the hall sensors, I ended up switching to mechanical endstops which was much more straightforward to wire up. I also added LEDs to both tools which are used to signal tool locking and errors when using the software.  

<img width="833" alt="single_tool_docked" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/aa28ba0f-9668-490b-b8ea-f43f136705b5">

When restarting the system with these tools, I get this displayed on my console. 

<img width="843" alt="console_when_sensors_working" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/bf6611f0-5078-4f2c-abbd-f2bf0762822d">

Now you can test the switches again:

<img width="384" alt="sensor_test_working_tc_td" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/6bf1ad6f-bbc5-4bca-b876-3f281f43b3c6">

And the LEDs are off for both tools:

<img width="808" alt="both_tool_leds_off" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/14766c3e-0063-4203-b0c9-e92f3b88d92f">

But then when I run DOCK_TEST, I get the following error:

<img width="1230" alt="dock_test_error1" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/984ed3f5-35f9-4069-a875-ac226186ed6e">

So then maybe the TC and TD needs to be switched (does TC mean tool coupling and TD mean tool dock?), when doing this, I get these displayed on the console when restarting:

<img width="818" alt="console_when_tc_td_straight" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/b173fc67-f3f6-4d58-9f63-ef3da1b286b5">

Then testing the switches shows:

<img width="423" alt="sensor_test_working" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/89826b7d-b939-4dc2-8606-b5d9a6bad4dd">

And in this case, the LEDs are both on:

<img width="969" alt="both_tool_leds_on" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/ab1f434c-be3e-49c1-9f4c-fd919c71540a">

But then when I run DOCK_TEST, I get the following error:

<img width="1091" alt="dock_test_error2" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/d94ca414-4973-421b-b87e-c34784a0bf80">



