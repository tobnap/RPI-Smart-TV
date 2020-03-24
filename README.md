# RPI-Smart-TV

## Prerequisites
Start with a clean install of the [latest release of Raspbian](https://www.raspberrypi.org/downloads/raspbian/) (currently Buster). Raspbian Buster Lite is recommended.

1. Update Raspbian, including the kernel and firmware, followed by a reboot:
```
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get autoremove
sudo reboot
```
2. Set the WiFi country in raspi-config's **Localisation Options**: `sudo raspi-config`

With the prerequisites done, you can proceed with the installer steps below.


## Installer
Install script to setup tv
```sh
wget -q https://git.io/JvSTQ -O /tmp/tv && bash /tmp/tv
```