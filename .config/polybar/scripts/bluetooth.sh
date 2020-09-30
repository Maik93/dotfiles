#!/bin/sh
# You can find upower dev by running `upower -e`
UPOWER_DEV=/org/freedesktop/UPower/devices/gaming_input_sony_controller_battery_d0o27o88o8bo26o42

if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  # powered off
  echo "%{F#66ffffff}"
else
  if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
  then
    # powered on && device disconnected
    echo ""
  else
    # powered on && device connected
    #echo -n "%{F#2193ff}"
    echo "%{F#2193ff}"
    #upower -i $UPOWER_DEV | grep percentage | awk 'BEGIN{FS=":[ \t]*"} {print $2}' | echo " $(cat -)"
  fi
fi
