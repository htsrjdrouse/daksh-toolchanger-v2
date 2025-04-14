This installs klipper on a rasppi (called clientPi) so that the Rasppi running klipper (called klipperPi) can get access to the clientPi's gpio pins. 

1. git clone https://github.com/Klipper3d/klipper.git
cd klipper

2. make menuconfig
make clean
make

3. ls -l /home/[username]/klipper/out/klipper.elf
4. test it /home/[username]/klipper/out/klipper.elf -I /tmp/klipper_host_mcu_camera_pi
5. If it runs and creates /tmp/klipper_host_mcu_camera_pi, it’s functionally klipper_mcu. Rename it: mv /home/[username]/klipper/out/klipper.elf /home/[username]/klipper/out/klipper_mcu
chmod +x /home/[ussername]/klipper/out/klipper_mcu
6. Edit service file sudo nano /etc/systemd/system/klipper-mcu.service:

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
    
10. Create a ssh tunnel as a bash shell script that looks like this (I call the script camera_control.py &):

#!/bin/bash

# Remove stale socket file if it exists
if [ -e /tmp/klipper_host_mcu_camera_pi_local ]; then
    sudo rm /tmp/klipper_host_mcu_camera_pi_local
fi

ssh -N -L /tmp/klipper_host_mcu_camera_pi_local:/tmp/klipper_host_mcu_camera_pi username@clientPi

11. Autostart Script on Camera Pi
Add the script to /etc/rc.local for startup:

bash
sudo nano /etc/rc.local
Add before exit 0:

text
python /home/username/camera_control.py &

