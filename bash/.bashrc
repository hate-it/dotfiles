#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="$PATH:$(du -L "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# added by travis gem
[ ! -s /home/muej/.travis/travis.sh ] || source /home/muej/.travis/travis.sh

source /home/muej/.config/broot/launcher/bash/br
