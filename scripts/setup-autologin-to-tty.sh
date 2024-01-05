#!/usr/bin/env bash

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

