#!/usr/bin/env bash

# Install dependencies
if command -v apt-get > /dev/null; then # Install for debian-based distros
  sudo apt-get install -y gcc ripgrep wget xsel
fi

wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod +x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

