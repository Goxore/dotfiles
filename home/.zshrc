#ZSHRC

# to switch shell - sudo chsh $USER -s /bin/zsh
command -v xrdb &> /dev/null
xrdb ~/.Xresources

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Yank to the system clipboard
function vi-yank-xclip {
    zle vi-yank
   echo "$CUTBUFFER" | xclip -i
}

zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)	

#exports--------------------
command -v nvim &> /dev/null
export EDITOR='nvim'

export PATH=$HOME/scripts/:$PATH
export PATH=$HOME/.bin/:$PATH

#alias--------------------
alias kp='killall polybar'
alias dev='devour'
alias dz='devour zathura'
alias grep='grep --color=auto'
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias open='xdg-open'
alias dopen='devour xdg-open'
alias devopen='devour xdg-open'
alias lf='lfrun'
alias dragout='dragon-drop -a -x'
alias dout='dragon-drop -a -x'
alias din='dragonmove'
alias cal="cal -m"
alias wiki="nvim $HOME/vimwiki/index.wiki"
alias vw="nvim $HOME/vimwiki/index.wiki"
alias v="nvim"
alias hst="history 1 | cut -c 8- | sort | uniq | fzf | tr -d '\n' | xclip -selection c"
alias pimg="xclip -se c -t image/png -o > out.png"
alias :q="exit"
alias vv="neovide"

command -v gxrfetch &> /dev/null && \
alias l="exa --icons -a --group-directories-first"
#extractor ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#Prompt customization--------------------

autoload -U colors && colors

PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M  %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# muhfetch
command -v gxrfetch &> /dev/null && \
gxrfetch

#other--------------------
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

#lfcd
LFCD="$HOME/.config/lf/lfcd.sh"
#LFCD="$HOME/scripts/lfrun"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi

alias lf="lfcd"

#bind '"\C-o":"lfcd\C-m"'


#plugins

[ -f /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh ] && \
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

[ -f /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ] && \
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

#autosuggestions

command -v xrdb &> /dev/null
bgcolor=$(xrdb -get color0)

command -v xrdb &> /dev/null
autohg=$(xrdb -get color19)

[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh ] && \
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=$autohg,bg=$bgcolor"
bindkey '^ ' autosuggest-accept

# source /usr/share/zsh/plugins/manual/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Yank to the system clipboard
function vi-yank-xclip {
    zle vi-yank
   echo "$CUTBUFFER" | xclip -selection clipboard
}

zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip

[ -f /usr/bin/starship ] && \
eval "$(starship init zsh)"


[ -f ~/aliasrc.sh ] && \
source ~/aliasrc.sh

# Funny haskell stuff
[ -f "/home/yurii/.ghcup/env" ] && \
source "/home/yurii/.ghcup/env"


