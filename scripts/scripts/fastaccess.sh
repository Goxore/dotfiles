#!/bin/zsh
select=$(cat $HOME/scripts/fastaccesslist | rofi -dmenu)
echo $select

[ -n "$select" ] && $HOME/scripts/$select
