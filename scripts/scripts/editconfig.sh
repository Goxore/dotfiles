#!/bin/sh
listpath=$HOME/scripts/configlist

select=$(awk '{print $1}' ~/dotfiles/scripts/scripts/configlist | rofi -dmenu)
wait $select

if [ $select = "configlist" ]; then
  nvim ~/scripts/configlist
else
a=$(grep $select $listpath | awk '{print $2}')
b=$(grep $select $listpath | awk '{print $3}')

nvim $HOME/.config/$a/$b
fi
