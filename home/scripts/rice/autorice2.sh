#!/bin/env bash

x1="$(xrdb -query | grep 'color1:'| awk '{print $NF}')"
x2="$(xrdb -query | grep 'color9:'| awk '{print $NF}')"
x3="$(xrdb -query | grep 'color2:'| awk '{print $NF}')"
x4="$(xrdb -query | grep 'color10:'| awk '{print $NF}')"
x5="$(xrdb -query | grep 'color3:'| awk '{print $NF}')"
x6="$(xrdb -query | grep 'color11:'| awk '{print $NF}')"
x7="$(xrdb -query | grep 'color4:'| awk '{print $NF}')"
x8="$(xrdb -query | grep 'color12:'| awk '{print $NF}')"
x9="$(xrdb -query | grep 'color5:'| awk '{print $NF}')"
x10="$(xrdb -query | grep 'color13:'| awk '{print $NF}')"
x11="$(xrdb -query | grep 'color6:'| awk '{print $NF}')"
x12="$(xrdb -query | grep 'color14:'| awk '{print $NF}')"


applytelegram(){
  killall telegram-desktop
  wal-telegram && telegram-desktop $HOME/.cache/wal-telegram/wal.tdesktop-theme &
}

wallpaperPicker(){
    wallist=$(ls $HOME/Wallpapers)
    pickedWallpaper=$(printf "$wallist" | sed 's/\s\+/\n/g' | rofi -dmenu)
    [ -z "$pickedWallpaper" ] && return 0
    echo "$pickedWallpaper" > $HOME/.cache/lastwallpaper

    echo "$HOME/Wallpapers/$pickedWallpaper" > $HOME/.cache/wal/wal

    export WALLPAPER="$pickedWallpaper"
}

colorschemePicker(){
    list=$(flavours list)
    pickedScheme=$(printf "$list" | sed 's/\s\+/\n/g' | rofi -dmenu)
    [ -z "$pickedScheme" ] && return 0
    echo "$pickedScheme" > /tmp/ricePickedScheme
}

applyColorscheme(){
    [ -f "/tmp/ricePickedScheme" ] || return 0
    flavours apply $(cat /tmp/ricePickedScheme)
}

applyWallpaper(){
    [ -f "$HOME/.cache/lastwallpaper" ] || return 0
    lastWallpaper=$(cat "$HOME/.cache/lastwallpaper")
    [ -z "$lastWallpaper" ] && return 0
    feh --bg-fill "$HOME/Wallpapers/$lastWallpaper"
}

applyAll(){
    applyColorscheme
    applyWallpaper
    applytelegram
    awesome-client 'awesome.restart()'
}

scriptLoop(){
    menu=$(printf "change wallpaper\nchange colorscheme\napply" | rofi -dmenu)
    case "$menu" in
        "change wallpaper") wallpaperPicker
        ;;
        "change colorscheme") colorschemePicker
        ;;
        "apply") applyAll && exit
        ;;
        *) exit
        ;;
    esac
    scriptLoop
}

scriptLoop
