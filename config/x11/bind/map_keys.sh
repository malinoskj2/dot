#!/usr/bin/env sh

xkbcomp -w0 -I$HOME/env/config/x11/bind/xkb2 ~/env/config/x11/bind/xkb2/keymap/mykbd $DISPLAY
