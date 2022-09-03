#!/bin/env bash

[ -z "$LAUNCHER" ] && LAUNCHER="rofi -dmenu"

file="$HOME/scripts/fastAccess/fastlist"
select=$(cat $file | cut -d':' -f1 | $LAUNCHER)

[ ! -z "$select" ] && \
grep "$select" $file && bash -c "$(grep "$select" $file | cut -d':' -f2)"
