#!/usr/bin/env sh

# Formatting ex. zroot/zfs_mnt < /DriveB/Backups/ZFS/nightly.zfs
zfs receive "$2" < "$1"   
