#!/bin/bash

IDF_COMMIT=$(git -C "$IDF_PATH" rev-parse --short HEAD)
IDF_BRANCH=$(git -C "$IDF_PATH" symbolic-ref --short HEAD)

idf_version_string=${IDF_BRANCH//\//_}"-$IDF_COMMIT"
archive_path="dist/arduino-esp32-libs-$idf_version_string.tar.gz"
build_archive_path="dist/arduino-esp32-build-$idf_version_string.tar.gz"
pio_archive_path="dist/arduino-ESP32-$idf_version_string.tar.gz"

mkdir -p dist && rm -rf "$archive_path" "$build_archive_path"
if [ -d "out" ]; then
	cd out && tar zcf "../$archive_path" * && cd ..
fi
if [ -d "build" ]; then
	cd build && tar zcf "../$build_archive_path" * && cd ..
fi

if [ -d "out" ]; then
    cd out
    echo "POST INSTALL"
    AR_BRANCH_SUFFIX="idf-$IDF_BRANCH"
    AR_BRANCH_SUFFIX=${AR_BRANCH_SUFFIX%"$-solo1"}
    git clone "https://github.com/tasmota/arduino-esp32 -b $AR_BRANCH_SUFFIX"
    rm -rf arduino-esp32/tools/sdk
    cp -Rf tools/sdk arduino-esp32/tools/sdk
    tar --exclude=".*" -zcvf pio_archive_path arduino-esp32/
    cd ..
fi
