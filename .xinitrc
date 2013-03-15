#!/bin/sh
xrdb -merge "${HOME}/.Xresources"

command -v setxkbdmap && setxkbdmap fr || command -v setxkbmap && setxkbmap fr

urxvtd -q -f -o &
exec awesome

if [[ command -v VBoxClient ]]
  VBoxClient --display
  VBoxClient --clipboard
  VBoxClient --seamless
fi
