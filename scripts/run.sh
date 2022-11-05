#!/usr/bin/bash
set -o errexit
set -o nounset

adb shell rm -f -r /sdcard/interface-counter
adb shell mkdir -p /sdcard/interface-counter
adb shell input tap 800 160
sleep 2
adb shell input keyevent 20 # KEYCODE_DPAD_DOWN
adb shell input keyevent 20 # KEYCODE_DPAD_DOWN
adb shell input keyevent 20 # KEYCODE_DPAD_DOWN
adb shell input keyevent 20 # KEYCODE_DPAD_DOWN
adb shell input keyevent 20 # KEYCODE_DPAD_DOWN
sleep 2
adb shell input keyevent 66 # KEYCODE_ENTER
