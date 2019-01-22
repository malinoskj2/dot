#!/usr/bin/env zsh

local hostname="$(hostname)"

xmodmap -e "keycode 51 = BackSpace" # backslash -> BackSpace
xmodmap -e "keycode 22 = backslash bar" # BackSpace -> backslash bar

xmodmap -e "clear Lock"
xmodmap -e "clear Control"


# Assigns all keys with Keysym Control_L or Control_R to
# the control modifier.
xmodmap -e "add Control = Control_L Control_R"

#xmodmap -e "keycode 66 = Control_L" # Caps_Lock -> Control_L

if [[ "$hostname" == "home" ]]; then
xmodmap -e "keycode 66 = Mode_switch Mode_switch" # Caps_Lock -> Mode_switch

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

fi

if [[ "$hostname" == "jesse-cb" ]]; then
xmodmap -e "keycode 133 = Mode_switch Mode_switch" # Caps_Lock -> Mode_switch

# Disable arrow keys

# Up Bindings
#xmodmap -e "keycode 111 = Up"     # Up Enable
xmodmap -e "keycode 111 = "        # Up Disable

# Left Bindings
#xmodmap -e "keycode 113 = Left"  # Left Enable
xmodmap -e "keycode 113 = "       # Left Disable

# Down Bindings
#xmodmap -e "keycode 116 = Down"  # Down Enable
xmodmap -e "keycode 116 = "       # Down Disable

# Right Bindings
#xmodmap -e "keycode 114 = Right" # Right Enable
xmodmap -e "keycode 114 = "       # Right Disable

fi

# Make Mode_switch + ijkl function as arrow keys

#xmodmap -e "keycode 109 = Control_L Control_R"

xmodmap -e "keycode 31 = i I Up" # i binding
xmodmap -e "keycode 44 = j J Left" # j binding
xmodmap -e "keycode 45 = k K Down" # k binding
xmodmap -e "keycode 46 = l L Right" # l binding

xmodmap -e "keycode 30 = u U Home" # Mod + u -> Home
xmodmap -e "keycode 32 = o O End"  # Mod + o -> End
