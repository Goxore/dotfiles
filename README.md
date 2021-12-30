# Goxore's linux dotfiles


## Installation

Clone the repo to your home folder/any other folder you want. You can apply any config files directly from the repo folder using [GNU Stow](https://www.gnu.org/software/stow/)

example:
```bash
stow i3
```

Before doing it, you might want to rename/move your dotfiles so you don't mess up anything.


This will create a symlink from the repo folder to your ~/.config/i3/config so that i3 can actually use it.

## Usage

Most of the scripts from /myscripts are <s>stolen</s> borrowed from other people's dotfiles, so feel free to take anything you like.

Without additional editing scripts will not work unless installed using symlink, because all apps will look for ~/myscripts
