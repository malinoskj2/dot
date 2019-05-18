#!/usr/bin/env zsh

# Toggle between monitors in bspwm with any dual-monitor setup

FOCUSED_MONITOR="$(bspc query -M --names -d focused)"
MONITORS=($(bspc query -M --names))

for monitor in $MONITORS; do
	if [ "$monitor" != "$FOCUSED_MONITOR" ]; then
		bspc monitor $monitor -f
	fi
done

