#!/usr/bin/env zsh

# Set fan speed to auto or to a manual speed on thinkpad
# need relevent flags on in /boot/loader.conf for it to do anything 

# $1 should be 0 or from 1-7
# 0: automatic speed
# 1-7: manual speed, 1(lowest) 7(max)

function set_auto() {
  sudo sysctl dev.acpi_ibm.0.fan=1 &> /dev/null && 
  sudo sysctl dev.acpi_ibm.0.fan_level=7 &> /dev/null &&
  echo "speed: automatic" 
}

function set_manual() {
  sudo sysctl dev.acpi_ibm.0.fan=0 &> /dev/null &&
  sudo sysctl dev.acpi_ibm.0.fan_level=$1 &> /dev/null &&
  echo "speed: $1" 
}

function no_args() {
    echo "no args supplied"
}

function unknown_arg() {
    echo "unknown arg"
}

if [ $# -eq "0" ]; then
  no_args && exit 1 
elif [ "$1" = "0" ]; then
  set_auto && exit 0
elif [ $1 -gt 0 ] && [ $1 -lt 8 ]; then
  set_manual $1 && exit 0  
fi

unknown_arg
exit 1
