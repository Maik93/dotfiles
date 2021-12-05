#!/bin/sh

echo "$1";
if [ -z "$1" ]; then
    w=80
    h=16
    name="scratchy"
else
    w=$1
    h=$2
    name="big-scratchy"
fi

# id=$(xdo id -n scratchy);
# if [ -z "$id" ]; then
#   urxvt -name scratchy;
# else
#   action='hide';
#   if [[ $(xprop -id $id | awk '/window state: / {print $3}') == 'Withdrawn' ]]; then
#     action='show';
#   fi
#   xdo $action -n scratchy
# fi

kitty --name=$name -o initial_window_width=${w}c -o initial_window_height=${h}c
