#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
polybar -c ~/.config/polybar/config.ini main &

is_external_monitor_present=$(xrandr --query | grep '^DP1 connected')
if [[ $is_external_monitor_present ]]; then
    polybar -c ~/.config/polybar/config_second_monitor.ini main &
fi

