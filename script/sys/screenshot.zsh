#!/usr/bin/env zsh

SS_DIR="/tmp/screenshot"
FILE_PATH="${SS_DIR}/ss_$(date +%s).jpg"

mkdir -p "${SS_DIR}" && 
import "${FILE_PATH}" &&
echo "screenshot saved @ ${FILE_PATH}" &&
OUTPUT=$(curl -F file="@${FILE_PATH}" \
https://imagebin.ca/upload.php | tail -n 1 | sed 's/.*url://')
echo $OUTPUT 
echo $OUTPUT | xclip -selection clipboard
