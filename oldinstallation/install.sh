#!/bin/bash
# Dotfile programs installation script
# Heavily inspired by Luke Smiths LARBS
# must be used with sudo/doas

progsfile="programs.csv"
optprogsfile="optprograms.csv"

[ -z "$aurhelper" ] && aurhelper="yay"
[ -z "$progsfile" ] && progsfile="https://raw.githubusercontent.com/Goxore/dotfiles/main/installation/programs.csv"
[ -z "$optprogsfile" ] && optprogsfile="https://raw.githubusercontent.com/Goxore/dotfiles/main/installation/optprograms.csv"

name=$(dialog --inputbox "Please enter your username." 10 60 3>&1 1>&2 2>&3 3>&1) || exit 1

installpkg(){ pacman --noconfirm --needed -S "$1" >/dev/null 2>&1 ;}

error() { printf "%s\n" "$1" >&2; exit 1; }

installationloop() { \
	([ -f "$progsfile" ] && cp "$progsfile" /tmp/progs.csv) || curl -Ls "$progsfile" | sed '/^#/d' > /tmp/progs.csv
  
	total=$(wc -l < /tmp/progs.csv)
	aurinstalled=$(pacman -Qqm)
	while IFS=, read -r tag program comment; do
		n=$((n+1))
		echo "$comment" | grep -q "^\".*\"$" && comment="$(echo "$comment" | sed "s/\(^\"\|\"$\)//g")"
		case "$tag" in
			"A") aurinstall "$program" "$comment" ;;
			"G") gitmakeinstall "$program" "$comment" ;;
			"P") pipinstall "$program" "$comment" ;;
			*) maininstall "$program" "$comment" ;;
		esac
	done < /tmp/progs.csv ;}

maininstall() {
	dialog --title "Installation" --infobox "Installing \`$1\` ($n of $total). $1 $2" 5 70
	installpkg "$1"
}

gitmakeinstall() {
	progname="$(basename "$1" .git)"
	dir="$repodir/$progname"
	dialog --title "Installation" --infobox "Installing \`$progname\` ($n of $total) via \`git\` and \`make\`. $(basename "$1") $2" 5 70
	sudo -u "$name" git clone --depth 1 "$1" "$dir" >/dev/null 2>&1 || { cd "$dir" || return 1 ; sudo -u "$name" git pull --force origin master;}
	cd "$dir" || exit 1
	make >/dev/null 2>&1
	make install >/dev/null 2>&1
	cd /tmp || return 1 ;}

aurinstall() { \
	dialog --title "Installation" --infobox "Installing \`$1\` ($n of $total) from the AUR. $1 $2" 5 70
	echo "$aurinstalled" | grep -q "^$1$" && return 1
	sudo -u "$name" $aurhelper -S --noconfirm "$1" >/dev/null 2>&1
}

optinstall(){
  optpackages=$(dialog --stdout --no-items --checklist "Choose optional packages to install:" 60 70 3 "Cheese" on "Tomato Sauce" off "Anchovies" off)
}

pipinstall() { \
	dialog --title "Installation" --infobox "Installing the Python package \`$1\` ($n of $total). $1 $2" 5 70
	[ -x "$(command -v "pip")" ] || installpkg python-pip >/dev/null 2>&1
	yes | pip install "$1"
}

createneededfolders()
{
  mkdir ~/.config/nvim
  mkdir ~/Wallpapers
}

installationloop
createneededfolders

clear
