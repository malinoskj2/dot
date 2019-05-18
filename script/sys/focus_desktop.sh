#!/usr/bin/env zsh


TARGET_INDEX=$1

DESKTOPS=($(bspc query -D --names | sort -u ))

bspc desktop ${DESKTOPS[${TARGET_INDEX}]} -f 
