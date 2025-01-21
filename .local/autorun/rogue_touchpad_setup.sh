#!/usr/bin/bash

# Add an udev rule too:
#
# Ref: https://askubuntu.com/questions/1006660/changes-with-xinput-randomly-revert-back-to-default/1007888#1007888

# Xinput configs (touchpad)
# Ref: https://man.archlinux.org/man/libinput.4
export touchpad="ASUF1205:00 2808:0106 Touchpad"
xinput set-prop "$touchpad" "libinput Tapping Enabled" 1
xinput set-prop "$touchpad" "libinput Natural Scrolling Enabled" 1
xinput set-prop "$touchpad" "libinput Scrolling Pixel Distance" 50
xinput set-prop "$touchpad" "libinput Accel Speed" 0.2
#xinput set-prop "$touchpad" "libinput Click Method Enabled" 0 1
#xinput set-prop "$touchpad" "libinput Disable While Typing Enabled" 0

# Start libinput gestures
#libinput-gestures-setup start

