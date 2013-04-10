#!/bin/sh

# X shell settings
xrdb -merge "${HOME}/.Xresources"

# keyboard
command -v setxkbdmap && setxkbdmap fr || command -v setxkbmap && setxkbmap fr

# Urxvt daemon
urxvtd -q -f -o &

# VirtualBox integration
if [[ -x $(command -v VBoxClient) ]];
then
  VBoxClient --display
  VBoxClient --clipboard
  VBoxClient --seamless
fi

# Awesome WM
exec awesome

