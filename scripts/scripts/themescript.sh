#!/bin/sh

./alacrittyreload.sh

killall polybar

i3 restart

~/.telegram-palette-gen/telegram-palette-gen --wal

pcmanfm ~/.cache/telegram-palette-gen/
