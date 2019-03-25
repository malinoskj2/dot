#!/usr/bin/env zsh

local hostname="$(hostname)"

xmodmap -e "keycode 51 = BackSpace" # backslash -> BackSpace
xmodmap -e "keycode 22 = backslash bar" # BackSpace -> backslash bar

xmodmap -e "clear Lock"
xmodmap -e "clear Control"


# Assigns all keys with Keysym Control_L or Control_R to
# the control modifier.

xmodmap -e "add Control = Control_L Control_R"

xmodmap -e "keycode 66 = Mode_switch Mode_switch" # Caps_Lock -> Mode_switch
xmodmap -e "keycode 31 = i I Up" # i binding
xmodmap -e "keycode 44 = j J Left" # j binding
xmodmap -e "keycode 45 = k K Down" # k binding
xmodmap -e "keycode 46 = l L Right" # l binding

xmodmap -e "keycode 30 = u U Home" # Mod + u -> Home
xmodmap -e "keycode 32 = o O End"  # Mod + o -> End
