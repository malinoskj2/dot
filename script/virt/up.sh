#!/usr/bin/env zsh

# Launch script for a linux guest via bhyve

function destroyExisting () {
  sudo ifconfig tap0 destroy	
  sudo ifconfig bridge0 destroy	
}

function checkModLoad () {

  kldstat -n vmm > /dev/null 2>&1
  if [ $? -ne 0 ]; then
      errmsg "vmm.ko is not loaded"
      exit 1
  fi
}

function createInterfaces () {
  ifconfig tap0 create 
  sysctl net.link.tap.up_on_open=1 
  ifconfig bridge0 create 
  ifconfig bridge0 addm re0 addm tap0 
  ifconfig bridge0 up 
}

function launchBhyve () {

  bhyve -AHP -s 0:0,hostbridge -s 1:0,lpc \
  -s 2:0,virtio-net,tap0 -s 3:0,virtio-blk,./bhyvelinux_storage.img \
  -s 4:0,ahci-cd,./ubuntu-18.04.2-live-server-amd64.iso -c 4 -m 2048M \
  -l bootrom,/usr/local/share/uefi-firmware/BHYVE_UEFI.fd \
  bhyveguest
}

checkModLoad
destroyExisting
createInterfaces
launchBhyve
