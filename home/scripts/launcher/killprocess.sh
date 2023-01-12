#!/bin/sh

[ -z "$LAUNCHER" ] && LAUNCHER="rofi -dmenu"
process=$(ps -a ww -u $USER -o cmd | cut -d' ' -f1 | awk -F'/' '{ print $NF }' | sort -u | grep -vE '(ps|cut|awk|sort|grep)' | $LAUNCHER)

[ -z $(pidof "$process") ] && exit

killall -s KILL $process
notify-send "$process killed"
