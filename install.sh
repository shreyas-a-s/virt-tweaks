#!/usr/bin/env bash

sudo apt-get install -y icewm neovim htop git pcmanfm nitrogen gnome-backgrounds xinit xterm xfce4-terminal x11-xserver-utils command-not-found spice-vdagent xdg-utils dmenu xsel firefox-esr

sudo update-alternatives --set x-terminal-emulator /usr/bin/xfce4-terminal.wrapper

# Enable autologin
if [ -f /etc/inittab ]; then # For non-systemd distros
  sudo cp /etc/inittab /etc/inittab.bak
  sed -i '/1:2345/s/^/#/' /etc/inittab
  sed -i "/1:2345/a\1:2345:respawn:/bin/login -f $USER tty1 </dev/tty1 >/dev/tty1 2>&1" /etc/inittab
else # For systemd distros
  [ -d /etc/systemd/system/getty@tty1.service.d ] || sudo mkdir /etc/systemd/system/getty@tty1.service.d
  printf "[Service]\
  \nExecStart=\
  \nExecStart=-/sbin/agetty -o '-p -f -- \\\\\\\\u' --noclear --autologin $USER %%I \$TERM\
  \n" | sudo tee /etc/systemd/system/getty@tty1.service.d/autologin.conf > /dev/null
fi

# Enable automatic startx
printf "\
\nif [ -z "\$DISPLAY" ] && [ \$(tty) == /dev/tty1 ]; then\
\n  startx\
\nfi" >> ~/.bash_profile

