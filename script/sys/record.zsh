#!/usr/bin/env zsh

SS_DIR="/tmp/screenshot"
FILE_PATH="${SS_DIR}/recording_$(date +%s).mkv"

ffmpeg -y -f x11grab -r 60 -s 1920x1080 -i :0.0+0,24 -vcodec libx264 -threads 0 "${FILE_PATH}"
