This installs klipper on a rasppi (called clientPi) so that the Rasppi running klipper (called klipperPi) can get access to the clientPi's gpio pins. 

1. git clone https://github.com/Klipper3d/klipper.git
cd klipper

2. make menuconfig
Select linux process and Enable extra low-level configuration options   
make clean
make

4. ls -l /home/[username]/klipper/out/klipper.elf
5. test it /home/[username]/klipper/out/klipper.elf -I /tmp/klipper_host_mcu_camera_pi
6. If it runs and creates /tmp/klipper_host_mcu_camera_pi, it’s functionally klipper_mcu. Rename it: mv /home/[username]/klipper/out/klipper.elf /home/[username]/klipper/out/klipper_mcu
chmod +x /home/[ussername]/klipper/out/klipper_mcu
7. Edit service file sudo nano /etc/systemd/system/klipper-mcu.service:

[Unit]
Description=Klipper MCU Service for Camera Pi
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=[username]
ExecStart=/home/[username]klipper/out/klipper_mcu -I /tmp/klipper_host_mcu_camera_pi
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target

7. sudo systemctl daemon-reload
sudo systemctl restart klipper-mcu.service
sudo systemctl status klipper-mcu.service
ls /tmp/klipper_host_mcu*

8. Edit printer.cfg
[mcu camera_pi]
serial: /tmp/klipper_host_mcu_camera_pi

9. On the klipperPi set up ssh keys (e.g., ssh-copy-id to clientPi)
    
10. Create a ssh tunnel as a bash shell script that looks like this. Puyt this on the klipperPi (I call the script camera_control.sh &):
```
#!/bin/bash

# Remove stale socket file if it exists
if [ -e /tmp/klipper_host_mcu_camera_pi_local ]; then
    sudo rm /tmp/klipper_host_mcu_camera_pi_local
fi

ssh -N -L /tmp/klipper_host_mcu_camera_pi_local:/tmp/klipper_host_mcu_camera_pi pi@192.168.1.161
```
11. Autostart Script on Camera Pi
Add the script to /etc/rc.local for startup:

bash
sudo nano /etc/rc.local
Add before exit 0:

text
python /home/username/camera_control.sh &


Assign GPIO pins

GPIO18 for the LED, GPIO23 for the dock sensor, GPIO24 for the carriage sensor

12. Here is the recipe for installing camera-streamer

13. Updated installation steps:

First, let's clean up the current directory and start fresh:

cd ~
rm -rf camera-streamer

Clone the repository with submodules:
```
git clone --recursive https://github.com/ayufan/camera-streamer.git
cd camera-streamer
```
If you've already cloned without the --recursive flag, initialize and update the submodules:
```
git submodule update --init --recursive
```
Install additional dependencies:
```
sudo apt install -y libcamera-dev liblivemedia-dev libssl-dev libboost-dev libboost-program-options-dev libboost-system-dev libdrm-dev
```
Now attempt to build again:
```
sed -i 's/-Werror//g' Makefile
sudo apt install -y xxd
sudo apt install -y cmake
sudo apt install -y build-essential pkg-config
make
```
After successful build, install:
```
sudo make install
```
14. You need to open up the firewall for the port 8080

```
sudo apt install ufw
sudo ufw allow 8080
```

15. Then run the command:
```
camera-streamer   --camera-path=/base/soc/i2c0mux/i2c@1/imx519@1a   --camera-type=libcamera   --camera-width=1920   --camera-height=1080   --camera-fps=30   --camera-options=--autofocus-mode=continuous   --http-listen=0.0.0.0   --http-port=8080   --camera-format=MJPG
```
Then go to your browser and enter the right ip address:
http://[ip address]:8080/


