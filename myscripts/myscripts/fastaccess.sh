#!/bin/zsh
select=$(cat $HOME/myscripts/fastaccesslist | rofi -dmenu)
echo $select

[ -n "$select" ] && $HOME/myscripts/$select
