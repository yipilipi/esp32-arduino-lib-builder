# Tasmota ESP32 Arduino Lib Builder

This repository contains the scripts that produce the adopted libraries for Tasmota Arduino Esp32.

Tested on Ubuntu.

### Build on Ubuntu
```bash
sudo apt-get install git wget curl libssl-dev libncurses-dev flex bison gperf python python-pip python-setuptools python-serial python-click python-cryptography python-future python-pyparsing python-pyelftools cmake ninja-build ccache
sudo pip install --upgrade pip
git clone https://github.com/Jason2866/esp32-arduino-lib-builder
cd esp32-arduino-lib-builder
./build.sh
```
