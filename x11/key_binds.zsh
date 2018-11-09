#!/usr/bin/env zsh

xmodmap -e "keycode 51 = BackSpace" # backslash -> BackSpace
xmodmap -e "keycode 22 = backslash bar" # BackSpace -> backslash bar

xmodmap -e "clear Lock"
xmodmap -e "clear Control"

#xmodmap -e "keycode 66 = Control_L" # Caps_Lock -> Control_L

xmodmap -e "keycode 66 = Mode_switch Mode_switch" # Caps_Lock -> Mode_switch

# Assigns all keys with Keysym Control_L or Control_R to
# the control modifier.
xmodmap -e "add Control = Control_L Control_R"

# Make Mode_switch + ijkl function as arrow keys

#xmodmap -e "keycode 109 = Control_L Control_R"

xmodmap -e "keycode 31 = i I Up" # i binding
xmodmap -e "keycode 44 = j J Left" # j binding
xmodmap -e "keycode 45 = k K Down" # k binding
xmodmap -e "keycode 46 = l L Right" # l binding

# Disable arrow keys

# Up Bindings
#xmodmap -e "keycode 98 = Up"     # Up Enable
xmodmap -e "keycode 98 = "        # Up Disable

# Left Bindings
#xmodmap -e "keycode 100 = Left"  # Left Enable
xmodmap -e "keycode 100 = "       # Left Disable

# Down Bindings
#xmodmap -e "keycode 102 = Down"  # Down Enable
xmodmap -e "keycode 102 = "       # Down Disable

# Right Bindings
#xmodmap -e "keycode 104 = Right" # Right Enable
xmodmap -e "keycode 104 = "       # Right Disable
