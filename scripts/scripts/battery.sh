#!/bin/bash
upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep per | awk '{print $2}' | cut -b 1-2
