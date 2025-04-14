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


