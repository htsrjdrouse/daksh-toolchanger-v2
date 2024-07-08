# CAN setup #

CAN makes it straightforward to add more devices. This is done by using an ethernet cable that has twisted pair cables, one of which is used for the CAN connection (High and Low) and the others are grouped (3 for the 24V and the other 3 grouped for ground. 

The recipe for setting up the firmware for both the BTT EBB36 and EBB42 CAN device boards and the CAN bus adaptor (BTT U2C v2.1) are derived from KB3d - https://wiki.kb-3d.com/

## BTT U2C v2.1 setup ## 


<img width="533" alt="btt_u2c_brd" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/da9ebf1d-1675-4c39-acd4-f40f27085fa5">

A good DIN mount is posted here: https://github.com/VoronDesign/VoronUsers/tree/main/printer_mods/Electroleon/U2C_Mounting. 

After connecting the U2C board to the Raspberry Pi using, usb-c, type lsusb to see if it is being recognized. 


<img width="588" alt="lsusb_sees_u2c_brd" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/52d6ed81-37aa-450e-a8b0-3e141a2613ca">

If its working then you need to create a can0 file like so:
``` sudo nano /etc/network/interfaces.d/can0 ```

Then add this into the file:

```
allow-hotplug can0
  iface can0 can static
  bitrate 500000
  up ip link set can0 txqueuelen 1024
```

Then reboot the Pi, and check if it is working using ```ifconfig can0```, you should see something like this:

<img width="623" alt="ifconfig_can0_resp" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/951500f7-a78d-4f62-962a-91bad47a1557">

## BTT EBB36/42 setup ## 

Background info about these boards are posted on the BTT github: https://github.com/bigtreetech/EBB. Initially, you have to flash the firmware to set up CAN. To do that you need to connect to you Pi, using usb-c and you have to install a jumper to power up the EBB board like so:

<img width="702" alt="EBB_jumper" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/70f0cc18-a6d0-4de5-adb3-cea8dac43846">

SSH into your Pi, and type lsusb to see if you can see it:

<img width="450" alt="lsusb_ebb" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/c995113b-39c1-4f2a-95d2-8e1d904faef2">

If the device is showing you have to put it into DFU mode, you have to press/hold boot button then press the reset button. Afterwards type lsusb again, and see if the board is not in DFU mode like so:

<img width="534" alt="lsusb_ebb_dfu-mode" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/1e13c087-9e15-4726-b2d5-178415db23e6">

Now you have to prepare the firmware for bootloading, first by downloading the CanBoot code like so:

``` cd ~
git clone https://github.com/Arksine/CanBoot
```

After downloading, cd into that directory and run ```make menuconfig```, make sure you match the CAN bus speed. 


<img width="678" alt="make_menuconfig_a" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/9ef11243-2222-4dd7-951a-36eadca10dc4">

Now compile the bootloader

```make clean
make
```

Then load it onto the board like so:

```sudo dfu-util -a 0 -D ~/CanBoot/out/canboot.bin --dfuse-address 0x08000000:force:mass-erase:leave -d 0483:df11```

It should look something like this:


<img width="543" alt="looks_after_loading_bootloader" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/a0e8c918-325a-4872-90aa-e7a7c62e3112">

After successful flashing, you can now upload firmware via CAN (rather then USB), now you need to install a jumper to enable terminating resistor like so and remove the jumper that powered the EBB using USB:


<img width="648" alt="terminating_resistor_no_usb_power" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/cfaea081-7c8d-47d3-b2f0-24c9204375d3">


Now connect the EBB board via CAN, and verify its being recognized by typing ```python3 ~/CanBoot/scripts/flash_can.py -i can0 -q```


<img width="456" alt="flash_can" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/40d8e720-977f-45c1-8532-9021dc8d826b">


After you are able to detect, now you need to build Klipper. 

```cd ~/klipper
make menuconfig```

<img width="681" alt="ebb_klipper" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/3262c56d-58c9-4211-b8a0-2d447e7c9657">


After building, flash it to the EBB like so: ```python3 ~/CanBoot/scripts/flash_can.py -i can0 -u MYUUID -f ~/klipper/out/klipper.bin``` Remember to replace MYUUID with UID detected earlier. It should look something like this:


<img width="539" alt="flash_klipper" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/2ac8a685-12e8-4f7d-b5c7-f825fe762b74">


Now run klipper can bus query command to see it installed ok ```~/klippy-env/bin/python ~/klipper/scripts/canbus_query.py can0```








