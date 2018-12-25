#!/usr/bin/env zsh

# Wipe a disk and format as ufs

echo "formatting $1"

dd if=/dev/zero of=$1 bs=1M && # zero out disk

gpart create -s GPT $1 &&
gpart add -t freebsd-ufs -a 1M $1 &&
 
newfs -U $1 &&

echo "formatted $1 successfully"
