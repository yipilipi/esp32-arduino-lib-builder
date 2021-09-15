#!/bin/bash

source ./tools/config.sh

#
# CLONE/UPDATE ARDUINO
#
if [ ! -d "$AR_COMPS/arduino" ]; then
        echo "git clone $AR_REPO_URL $AR_COMPS/arduino"
	git clone $AR_REPO_URL "$AR_COMPS/arduino"
fi
if [ -z $ARDUINO_BRANCH ]; then
	has_ar_branch=`git_branch_exists "$AR_COMPS/arduino" "idf-$IDF_BRANCH"`
	if [ "$has_ar_branch" == "1" ]; then
		ARDUINO_BRANCH="idf-$IDF_BRANCH"
	else
		has_ar_branch=`git_branch_exists "$AR_COMPS/arduino" "$AR_PR_TARGET_BRANCH"`
		if [ "$has_ar_branch" == "1" ]; then
			ARDUINO_BRANCH="$AR_PR_TARGET_BRANCH"
                        echo "$ARDUINO_BRANCH"
		else
			ARDUINO_BRANCH="master"
                        echo "$ARDUINO_BRANCH"
		fi
	fi
fi

git -C "$AR_COMPS/arduino" checkout $ARDUINO_BRANCH && \
git -C "$AR_COMPS/arduino" fetch origin && \
git -C "$AR_COMPS/arduino" pull origin $ARDUINO_BRANCH
echo "checkout and pull origin $ARDUINO_BRANCH"

if [ $? -ne 0 ]; then exit 1; fi
git -C "$AR_COMPS/arduino" submodule update --init --recursive
echo "git -C "$AR_COMPS/arduino" submodule update --init --recursive"

#
# CLONE/UPDATE ESP32-CAMERA
#

if [ ! -d "$AR_COMPS/esp32-camera" ]; then
	git clone $CAMERA_REPO_URL "$AR_COMPS/esp32-camera"
else
	git -C "$AR_COMPS/esp32-camera" fetch origin && \
	git -C "$AR_COMPS/esp32-camera" pull origin master
fi
if [ $? -ne 0 ]; then exit 1; fi

#
# CLONE/UPDATE ESP-FACE
#

#if [ ! -d "$AR_COMPS/esp-face" ]; then
	git clone --recursive $FACE_REPO_URL -b "release/v.1.0" "$AR_COMPS/esp-face"
        echo "git clone --recursive $FACE_REPO_URL -b "release/v.1.0" "$AR_COMPS/esp-face""
# Source is now https://github.com/espressif/esp-dl/tree/release/v1.0
#else
#       git -C "$AR_COMPS/esp-face" fetch origin && \
#       git -C "$AR_COMPS/esp-face" pull origin master
#fi
if [ $? -ne 0 ]; then exit 1; fi
