#!/usr/bin/env sh

# Formatting ex. zroot/zfs_mnt < /DriveB/Backups/ZFS/nightly.zfs
zfs receive -e "$2" < "$1"   
