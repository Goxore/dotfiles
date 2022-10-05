#!/bin/bash
rand=$RANDOM
name="clipboard-$rand.png"
xclip -se c -t image/png -o > "/tmp/$name"
sxiv "/tmp/$name"
