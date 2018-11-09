#!/usr/bin/env zsh

xmodmap -e "keycode 51 = BackSpace" # backslash -> BackSpace
xmodmap -e "keycode 22 = backslash bar" # BackSpace -> backslash bar

xmodmap -e "clear Lock"
xmodmap -e "clear Control"

xmodmap -e "keycode 66 = Control_L" # Caps_Lock -> Control_L

# Assigns all keys with Keysym Control_L or Control_R to
# the control modifier. This is both regular control keys + 
# caps lock.
xmodmap -e "add Control = Control_L Control_R"
