#!/usr/bin/env bash

# Change Grub Timeout
if [ -f /etc/default/grub ]; then
  sudo sed -i "/GRUB_TIMEOUT/ c\GRUB_TIMEOUT=0" /etc/default/grub
  sudo grub-mkconfig -o /boot/grub/grub.cfg
fi

# Change systemd-boot Timeout
if [ -f /boot/loader/loader.conf ]; then
  sudo sed -i "/timeout/ c\timeout 0" /boot/loader/loader.conf
fi

