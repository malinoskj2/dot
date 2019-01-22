#!/usr/bin/env zsh

# Wipe a disk and format as ufs

echo "formatting $1"

gpart destroy -F $1 &&
gpart create -s GPT $1 &&
gpart add -t freebsd-ufs -a 1M $1 &&
 
newfs -U $1 &&
gpart recover $1

echo "formatted $1 successfully"
