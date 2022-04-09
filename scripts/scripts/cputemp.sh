#!/bin/sh
sensors | grep Package | awk '{print $4}' | cut -b 2-3
