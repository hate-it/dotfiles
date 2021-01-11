#!/bin/sh
export PATH="$PATH:$(du -L "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export EDITOR="vim"
export ANSIBLE_VAULT_PASSWORD_FILE=~/ansible/ansible-vault-key.txt

# Start graphical server if i3 not already running.
# [ "$(tty)" = "/dev/tty1" ] && ! pgrep -x sway >/dev/null && exec sway

export PATH="$HOME/.cargo/bin:$PATH"
[ command -v wal &> /dev/null ] && wal -R;
numlockx

