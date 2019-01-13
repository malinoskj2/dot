#!/usr/bin/env zsh

SNAPSHOTS=($(zfs list -t snapshot | cut -d  ' ' -f1 | tail -n +2))

# Wiping snapshots
for snapshot in $SNAPSHOTS; do
  sudo zfs destroy -R $snapshot
done
