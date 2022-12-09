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

# type-C port (HDMI adaptor)
elif [[ $(xrandr --query | grep '^DP-1 connected') ]]; then
    polybar -c ~/.config/polybar/config_usb_c-1.ini main &

# MiniDP port (daisy chain)
elif [[ $(xrandr --query | grep '^DP-1-0.8 connected') ]]; then
    polybar -c ~/.config/polybar/config_dp-1-0.8.ini main &

elif [[ $(xrandr --query | grep '^DP-1-0.1.8 connected') ]]; then
    polybar -c ~/.config/polybar/config_dp-1-0.1.8.ini main &

# type-C port (daisy chain)
elif [[ $(xrandr --query | grep '^DP-1-8 connected') ]]; then
    polybar -c ~/.config/polybar/config_usb_c-1-8.ini main &
fi
if [[ $(xrandr --query | grep '^DP-1-1-8 connected') ]]; then
    polybar -c ~/.config/polybar/config_usb_c-1-1-8.ini main &
fi
# third screen when Nvidia driver is active
if [[ $(xrandr --query | grep '^DP-1-1-1-8 connected') ]]; then
    polybar -c ~/.config/polybar/config_usb_c-1-1-1-8.ini main &
fi
