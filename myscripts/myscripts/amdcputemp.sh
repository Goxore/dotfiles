#!/bin/sh
sensors | grep CPUTIN | awk '{print $2}' | cut -c 2- | cut -c -2
