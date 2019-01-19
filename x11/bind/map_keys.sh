#!/usr/bin/env zsh

SCRIPT_DIR=${0:a:h};

setxkbmap -model pc104 -layout us -option 
setxkbmap -model pc104 -layout us -option "misc:extend,level5:caps_switch_lock"

xkbcomp -w0 -I$HOME/env/x11/bind/xkb2 ~/env/x11/bind/xkb2/keymap/mykbd $DISPLAY
