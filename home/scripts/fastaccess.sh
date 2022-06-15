#!/bin/zsh
select=$(cat $HOME/scripts/fastaccesslist | rofi -dmenu)
echo $select

[ -n "$select" ] && bash $HOME/scripts/$select
