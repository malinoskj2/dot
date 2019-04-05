#!/usr/bin/env zsh

# Reclaim resources from vm's

VM_LIST=($(ls /dev/vmm))

for vm in $VM_LIST; do
/usr/sbin/bhyvectl --destroy --vm=$vm 
done	

