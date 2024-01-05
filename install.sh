#!/usr/bin/env bash

# Change directory
SCRIPT_DIR=$(dirname -- "$( readlink -f -- "$0"; )") && cd "$SCRIPT_DIR" || exit

# Custom scripts
./scripts/install-programs.sh
./scripts/install-nvim.sh
./scripts/setup-autologin-to-tty.sh
./scripts/setup-auto-startx.sh

printf "### SET XDG DIR FOR ZSH ###\nZDOTDIR=~/.config/zsh\n" | sudo tee -a /etc/zsh/zshenv > /dev/null # set dotfile directory for zsh
while ! chsh -s "$(command -v zsh)"; do :; done

sudo update-alternatives --set x-terminal-emulator /usr/bin/xfce4-terminal.wrapper

