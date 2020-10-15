#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
polybar -c ~/.config/polybar/config.ini main &

# HDMI port
if [[ $(xrandr --query | grep '^HDMI-1-0 connected') ]]; then
    polybar -c ~/.config/polybar/config_hdmi-1-0.ini main &
fi

# MiniDP port (daisy chain)
if [[ $(xrandr --query | grep '^DP-1-0.8 connected') ]]; then
    polybar -c ~/.config/polybar/config_dp-1-0.8.ini main &
fi

if [[ $(xrandr --query | grep '^DP-1-0.1.8 connected') ]]; then
    polybar -c ~/.config/polybar/config_dp-1-0.1.8.ini main &
fi

# type-C port (daisy chain)
if [[ $(xrandr --query | grep '^DP-1-8 connected') ]]; then
    polybar -c ~/.config/polybar/config_usb_c-1-8.ini main &
fi

if [[ $(xrandr --query | grep '^DP-1-1-8 connected') ]]; then
    polybar -c ~/.config/polybar/config_usb_c-1-1-8.ini main &
fi
