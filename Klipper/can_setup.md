# CAN setup #

CAN makes it straightforward to add more devices. This is done by using an ethernet cable that has twisted pair cables, one of which is used for the CAN connection (High and Low) and the others are grouped (3 for the 24V and the other 3 grouped for ground. 

The recipe for setting up the firmware for both the BTT EBB36 and EBB42 CAN device boards and the CAN bus adaptor (BTT U2C v2.1) are derived from KB3d - https://wiki.kb-3d.com/

## BTT U2C v2.1 setup ## 


<img width="533" alt="btt_u2c_brd" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/da9ebf1d-1675-4c39-acd4-f40f27085fa5">

A good DIN mount is posted here: https://github.com/VoronDesign/VoronUsers/tree/main/printer_mods/Electroleon/U2C_Mounting. 

After connecting the U2C board to the raspberry pi using, usb-c, type lsusb to see if it is being recognized. 


<img width="588" alt="lsusb_sees_u2c_brd" src="https://github.com/htsrjdrouse/daksh-toolchanger-v2/assets/1452651/52d6ed81-37aa-450e-a8b0-3e141a2613ca">

If its working then you need to create a can0 file like so:
<code> sudo nano /etc/network/interfaces.d/can0 </code>




