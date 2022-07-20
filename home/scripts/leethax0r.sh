#!/bin/bash
mpv --no-video ~/Music/MrRobot.mp3 &
flavours apply greenscreen &
alacritty -e cmatrix &
video-to-ascii -f "/dev/video0"
