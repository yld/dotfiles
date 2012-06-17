#!/bin/sh
xrdb -merge "${HOME}/.Xresources"
setxkbdmap fr
#urxvtd -q -f -o &
exec awesome
