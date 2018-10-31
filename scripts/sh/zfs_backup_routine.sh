#!/bin/sh

DATE=`date +%Y-%m-%d`
BACKUP_DIR="$1"
SS_NAME="zroot@nightly_${DATE}"
FILE_NAME="nightly_${DATE}.zfs"

zfs snapshot -r $SS_NAME &&
zfs send -R  $SS_NAME > "$BACKUP_DIR/${FILE_NAME}" &&
zfs list -t snapshot -o name | grep "@nightly" | xargs -n 1 zfs destroy
