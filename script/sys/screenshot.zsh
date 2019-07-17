#!/usr/bin/env zsh

# Script to take screenshot and sometimes upload
# ${1} = "upload" or "save" 
# ${2} =  path to screenshot directory


UPLOAD=""
SS_DIR=""

if [ "$1" = "upload" ]; then
  UPLOAD="YES"
elif [ "$1" = "save" ]; then
  UPLOAD="NO"	
else 
  UPLOAD="NO" 
fi

# set SS_DIR
if [ -z "$2" ]; then
  SS_DIR="/tmp/screenshot"
  mkdir -p "${SS_DIR}"
else
  SS_DIR="$2"
fi

# create SS_DIR if it does not exist
[ -e "$SS_DIR" ] || mkdir -p $SS_DIR 


## Take the SS and save
FILE_PATH="${SS_DIR}/ss_$(date +%s).jpg"
import "${FILE_PATH}"

if [ "$UPLOAD" = "NO" ]; then
  echo "screenshot saved @ ${FILE_PATH}" 
  notify-send -t 5000 'Capture Finished!' "${FILE_PATH}" -i ${FILE_PATH}
  echo $FILE_PATH | tr -d '\n' | xclip -selection clipboard 
else 
  OUTPUT=$(curl -F file="@${FILE_PATH}" \
  https://vgy.me/upload | jq -r .url | sed -e 's/u\///g' -e 's/$/.jpg/')
  echo $OUTPUT 
  echo $OUTPUT | tr -d '\n' | xclip -selection clipboard &&
  notify-send -t 5000 'Upload Finished!' "${OUTPUT}" -i ${FILE_PATH}
fi

