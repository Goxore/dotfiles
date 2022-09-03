#!/bin/sh
# sensors | grep Package | awk '{print $4}' | cut -b 2-3
sensors | grep Composite | awk '{print $2}' | cut -b 2-3
