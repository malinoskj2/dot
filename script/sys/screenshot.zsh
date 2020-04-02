#!/usr/bin/env sh

# Script to take screenshot and sometimes upload
# ${1} = "upload" or "save" 
# ${2} =  path to screenshot directory

if [ -z "$2" ]; then
  SS_DIR="/tmp/screenshot"
  mkdir -p "${SS_DIR}"
else
  SS_DIR="$2"
fi

# create SS_DIR if it does not exist
[ -e "$SS_DIR" ] || mkdir -p $SS_DIR 

## Take the SS and save
FILE_NAME="$(date +%s).jpg"
FILE_PATH="${SS_DIR}/${FILE_NAME}"
import -quality 100 "${FILE_PATH}"

if [ "$1" = "save" ]; then
  echo "screenshot saved @ ${FILE_PATH}" 
  notify-send -t 5000 'Capture Finished!' "${FILE_PATH}" -i ${FILE_PATH}
  echo $FILE_PATH | tr -d '\n' | xclip -selection clipboard 
else 
  aws s3 cp --profile ss_uploader --acl=public-read $FILE_PATH "s3://${SS_BUCKET}/${FILE_NAME}"
  echo "https://${SS_BUCKET}.s3.amazonaws.com/${FILE_NAME}" | xclip -selection clipboard
fi

