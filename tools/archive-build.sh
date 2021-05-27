#!/bin/bash

IDF_COMMIT=$(git -C "$IDF_PATH" rev-parse --short HEAD)
IDF_BRANCH=$(git -C "$IDF_PATH" symbolic-ref --short HEAD)

idf_version_string=${IDF_BRANCH//\//_}"-$IDF_COMMIT"
archive_path="dist/arduino-esp32-libs-solo1-$idf_version_string.tar.gz"
build_archive_path="dist/arduino-esp32-build-solo1-$idf_version_string.tar.gz"
pio_archive_path="dist/framework-arduinoespressif32-solo1-$idf_version_string.tar.gz"
echo "$archive_path"
echo "$build_archive_path"
echo "$pio_archive_path"

mkdir -p dist && rm -rf "$archive_path" "$build_archive_path"
#if [ -d "out" ]; then
#cd out && tar zcf "../$archive_path" * && cd ..
#fi
#if [ -d "build" ]; then
#cd build && tar zcf "../$build_archive_path" * && cd ..
#fi

if [ -d "out" ]; then
    cd out
    echo "Creating framework-arduinoespressif32"
    git clone https://github.com/espressif/arduino-esp32 -b release/v1.0
    rm -rf arduino-esp32/tools/sdk
    rm -rf arduino-esp32/docs
    rm -rf arduino-esp32/tools/esptool.py
    rm -rf arduino-esp32/tools/gen_esp32part.py
    rm -rf arduino-esp32/tools/platformio-build.py
    rm -rf arduino-esp32/platform.txt
    cp -Rf tools/sdk arduino-esp32/tools/sdk
    cp -Rf tools/esptool.py arduino-esp32/tools/esptool.py
    cp -Rf tools/gen_esp32part.py arduino-esp32/tools/gen_esp32part.py
    cp -Rf tools/platformio-build.py arduino-esp32/tools/platformio-build.py
    cp -Rf platform.txt arduino-esp32/platform.txt
    cp ../core_version.h arduino-esp32/cores/esp32/core_version.h
    mv arduino-esp32/ framework-arduinoespressif32/
    tar --exclude=.* -zcf ../$pio_archive_path framework-arduinoespressif32/
    cd ..
fi

