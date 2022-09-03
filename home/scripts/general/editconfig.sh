#!/bin/sh
[ -z $EDITOR ] && EDITOR=vim
cd ~/.config
$EDITOR $HOME/.config/$(fzf -x)
