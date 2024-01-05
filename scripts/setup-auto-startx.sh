#!/usr/bin/env bash

if command -v zsh > /dev/null; then # Setup for zsh
printf "\
\nif [ -z "\$DISPLAY" ] && [ \$(tty) = /dev/tty1 ]; then\
\n  startx\
\nfi" | sudo tee -a /etc/zsh/zprofile > /dev/null
fi

if command -v bash > /dev/null; then # Setup for bash
printf "\
\nif [ -z "\$DISPLAY" ] && [ \$(tty) == /dev/tty1 ]; then\
\n  startx\
\nfi" | tee -a ~/.bashrc > /dev/null
fi

