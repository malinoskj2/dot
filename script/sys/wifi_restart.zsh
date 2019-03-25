#!/usr/bin/env zsh
# Disable and enable wlan0 

INTERFACE=wlan0

echo "Restarting $INTERFACE interface"

sudo ifconfig $INTERFACE down &&
sudo ifconfig $INTERFACE up

