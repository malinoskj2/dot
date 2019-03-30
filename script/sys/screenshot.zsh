#!/usr/bin/env zsh

SS_DIR="/tmp/screenshot"
FILE_PATH="${SS_DIR}/ss_$(date +%s).jpg"

mkdir -p "${SS_DIR}" && 
import "${FILE_PATH}" &&
echo "screenshot saved @ ${FILE_PATH}" &&
OUTPUT=$(curl -F file="@${FILE_PATH}" \
https://vgy.me/upload | jq -r .url | sed -e 's/u\///g' -e 's/$/.jpg/')
echo $OUTPUT 
echo $OUTPUT | xclip -selection clipboard &&
notify-send 'Upload Finished!' "${OUTPUT}" -i ${FILE_PATH}
