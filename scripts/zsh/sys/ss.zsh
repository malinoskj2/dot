#!/usr/bin/env zsh

SS_DIR="/tmp/screenshot"
FILE_PATH="/tmp/screenshot/ss_$(date +%s).jpg"

mkdir -p "${SS_DIR}" 
import "${FILE_PATH}" &&
echo "screenshot saved @ ${FILE_PATH}" 
