# Tasmota ESP32 Arduino Lib Builder

This repository contains the scripts that produce the adopted libraries for Tasmota Arduino Esp32.

Tested on Ubuntu.

### Build on Ubuntu
```bash
sudo apt-get install -y git wget curl libssl-dev libncurses-dev flex bison gperf python3 cmake ninja-build ccache
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py && \
pip3 install setuptools pyserial click future wheel cryptography pyparsing pyelftools
git clone https://github.com/Jason2866/esp32-arduino-lib-builder
cd esp32-arduino-lib-builder
./build.sh
```

