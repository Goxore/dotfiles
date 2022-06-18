#!/bin/bash
# Dotfile programs installation script
# Heavily inspired by Luke Smiths LARBS
# must be used with sudo/doas

# Variables
progsfile="programs"
progsoptfile="programsopt"

name=$(dialog --inputbox "Please enter your username." 10 60 3>&1 1>&2 2>&3 3>&1) || exit 1

# Functions
installpkg(){ pacman --noconfirm --needed -S "$1" >/dev/null 2>&1 ;}

error() { printf "%s\n" "$1" >&2; exit 1; }

installationloop() { \
  awk '{print $2, "off"}' programsopt > /tmp/progsoptlist
  progsoptlist=$(cat /tmp/progsoptlist)
  optlisttotal=$(wc -l < /tmp/progsoptlist)
  optlist=$(echo $progsoptlist | xargs)
  opttoinstall=$(dialog --stdout --no-items --checklist "Choose optional packages to install:" 60 80 100 $(echo $optlist))

  opttogrep=$(echo $opttoinstall | sed 's/ /\\\|/g')
  optfinal=$(grep "$opttogrep" programsopt)

  cat "$progsfile" > /tmp/progs
  echo "$optfinal" >> /tmp/progs

	total=$(wc -l < /tmp/progs)
	aurinstalled=$(pacman -Qqm)

  cat /tmp/progs | while read -r type program comment;
  do
		n=$((n+1))
		echo "$comment" | grep -q "^\".*\"$" && comment="$(echo "$comment" | sed "s/\(^\"\|\"$\)//g")"
		case "$type" in
			"A") aurinstall "$program" "$comment" ;;
			"G") gitmakeinstall "$program" "$comment" ;;
			"P") pipinstall "$program" "$comment" ;;
			"p") maininstall "$program" "$comment" ;;
		esac
  done
}

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

pipinstall() { \
	dialog --title "Installation" --infobox "Installing the Python package \`$1\` ($n of $total). $1 $2" 5 70
	[ -x "$(command -v "pip")" ] || installpkg python-pip >/dev/null 2>&1
	yes | pip install "$1"
}

createneededfolders()
{
  mkdir -p ~/.config/nvim
  mkdir -p ~/Wallpapers
}

# Exection


while true
do

  option=$(dialog --menu "hello" 20 50 2 1 "Update system" 2 "Install packages" 3 "stow" 4 "exit" 3>&1 1>&2 2>&3 3>&1)

  case "$option" in
    1)
      pacman --noconfirm -Syu
      ;;
    2)
      installationloop
      ;;
    3)
      cd ..
      stow configs
      stow home
      stow local
      ;;
    *)
      clear
      exit 0
      ;;
  esac
done

createneededfolders
