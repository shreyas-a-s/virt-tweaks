#!/usr/bin/env bash

# Change directory
SCRIPT_DIR=$(dirname -- "$( readlink -f -- "$0"; )") && cd "$SCRIPT_DIR" || exit

# Custom scripts
./scripts/install-command-not-found.sh  # Install command-not-found handler
./scripts/install-nvim.sh               # As the name suggests. nvim i.e. neovim is a text-editor btw.
./scripts/install-programs.sh           # Also, as the name suggests
./scripts/setup-auto-startx.sh          # Whenever user logs into tty, startx is run launching default window manager
./scripts/setup-autologin-to-tty.sh     # Autologin user to tty
./scripts/setup-bootloader.sh           # Set bootloader (grub/systemd-boot) timeout to 0 sec

# Setup zsh as user shell
printf "### SET XDG DIR FOR ZSH ###\nZDOTDIR=~/.config/zsh\n" | sudo tee -a /etc/zsh/zshenv > /dev/null # set dotfile directory for zsh
while ! chsh -s "$(command -v zsh)"; do :; done

# Set xfce4-terminal as default
sudo update-alternatives --set x-terminal-emulator /usr/bin/xfce4-terminal.wrapper

