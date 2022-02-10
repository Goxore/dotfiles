#!/bin/sh
listpath=$HOME/myscripts/configlist

select=$(awk '{print $1}' ~/dotfiles/myscripts/myscripts/configlist | rofi -dmenu)

a=$(grep $select $listpath | awk '{print $2}')
b=$(grep $select $listpath | awk '{print $3}')

nvim $HOME/.config/$a/$b
