#!/bin/sh

if [ $(pulseaudio-ctl | grep "Is source muted" | wc -c) -eq 47 ]
then
  pulseaudio-ctl mute-input
  notify-send "  - on"
  else
  pulseaudio-ctl mute-input
  notify-send "  - off"
fi
