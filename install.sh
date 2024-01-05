#!/usr/bin/env bash

# Change directory
SCRIPT_DIR=$(dirname -- "$( readlink -f -- "$0"; )") && cd "$SCRIPT_DIR" || exit

# Custom scripts
./scripts/install-programs.sh
./scripts/install-nvim.sh
./scripts/setup-autologin-to-tty.sh

printf "### SET XDG DIR FOR ZSH ###\nZDOTDIR=~/.config/zsh\n" | sudo tee -a /etc/zsh/zshenv > /dev/null # set dotfile directory for zsh
while ! chsh -s "$(command -v zsh)"; do :; done

sudo update-alternatives --set x-terminal-emulator /usr/bin/xfce4-terminal.wrapper

# Enable automatic startx
printf "\
\nif [ -z "\$DISPLAY" ] && [ \$(tty) = /dev/tty1 ]; then\
\n  startx\
\nfi" | sudo tee -a /etc/zsh/zprofile > /dev/null

# Change Grub Timeout
if [ -f /etc/default/grub ]; then
  sudo sed -i "/GRUB_TIMEOUT/ c\GRUB_TIMEOUT=0" /etc/default/grub
  sudo grub-mkconfig -o /boot/grub/grub.cfg
fi

sudo update-command-not-found
sudo apt-file update

