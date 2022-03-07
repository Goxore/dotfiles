#!/bin/bash
listpath=$HOME/scripts/configlist

select=$(awk '{print $1}' ~/dotfiles/scripts/scripts/configlist | rofi -dmenu)

if [ $select = "configlist" ]; then
 alacritty -e nvim ~/scripts/configlist
else
  a=$(grep $select $listpath | awk '{print $2}')
  b=$(grep $select $listpath | awk '{print $3}')

  [ -n "$select" ] && exec $TERMINAL -e nvim $HOME/.config/$a/$b
fi
