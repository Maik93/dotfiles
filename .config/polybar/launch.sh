#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
polybar -c ~/.config/polybar/config.ini main &

# DisplayPort second monitor
if [[ $(xrandr --query | grep '^DP-4.1.8 connected') ]]; then
    polybar -c ~/.config/polybar/config_displayport-4-1-8.ini main &
fi
