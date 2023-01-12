#!/bin/sh
rand=$RANDOM
name="clipboard-$rand.mp4"
yt-dlp "$(xclip -se c -o)" -o "/tmp/$name"
dragon-drop "/tmp/$name"
