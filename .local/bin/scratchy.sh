#!/bin/sh

echo "$1";
if [ -z "$1" ]; then
	size=80x16;
    name="scratchy"
else
	# size=120x40;
	size=$1;
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

urxvt -name $name -g "$size";
