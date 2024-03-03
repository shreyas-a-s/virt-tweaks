#!/usr/bin/env bash

# Install dependencies
if command -v apt-get > /dev/null; then # Install for debian-based distros
  sudo apt-get install -y gcc ripgrep wget xsel
fi

# Install fd
FD_VERSION="$(apt-cache show fd-find | awk 'NR==3{print $2}')"
FD_MAJOR_VERSION="$(echo "$FD_VERSION" | awk -F . '{print $1}')"
FD_MINOR_VERSION="$(echo "$FD_VERSION" | awk -F . '{print $2}')"
if [ "$FD_MAJOR_VERSION" -gt 8 ]; then
  sudo apt-get install -y fd-find
elif [ "$FD_MAJOR_VERSION" -eq 8 ] && [ "$FD_MINOR_VERSION" -gt 3 ]; then
  sudo apt-get install -y fd-find
else
  wget https://github.com/sharkdp/fd/releases/download/v8.3.2/fd_8.3.2_amd64.deb
  sudo apt-get install ./fd_8.3.2_amd64.deb
  rm ./fd_8.3.2_amd64.deb
fi

# Symlink fd -> fdfind
sudo ln -sf "$(which fdfind)" "$(dirname "$(which fdfind)")/fd"

# Install neovim
wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod +x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

