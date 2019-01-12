#!/usr/bin/env zsh

# Wipe a disk

echo "zeroing disk $1"

dd if=/dev/zero of=$1 bs=1M && # zero out disk

echo "zeroed $1 successfully"
