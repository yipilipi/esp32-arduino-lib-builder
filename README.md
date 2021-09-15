# Tasmota ESP32 Arduino Lib Builder

This repository contains the scripts that produce the adopted libraries for Tasmota Arduino Esp32.

Tested on Ubuntu.

### Build on Ubuntu
```bash
sudo apt-get install git wget curl libssl-dev libncurses-dev flex bison gperf python3 python3-pip python3-setuptools python3-serial python3-click python3-cryptography python3-future python3-pyparsing python3-pyelftools cmake ninja-build ccache
sudo pip install --upgrade pip
git clone https://github.com/Jason2866/esp32-arduino-lib-builder
cd esp32-arduino-lib-builder
./build.sh
```

