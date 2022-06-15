#!/bin/sh
i3-msg workspace "10:" 
pacmd set-source-mute $(pacmd list-sources | grep "*" | awk '{ print $3 }') 0
pactl set-sink-mute `pactl get-default-sink` 0
