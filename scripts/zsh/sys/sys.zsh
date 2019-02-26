#!/usr/bin/env zsh
# Sy s
# Display a few stats about system @ current time 
function battery_rem_cap() {
  acpiconf -i 0 | grep -i -e "Remaining capacity"
} 

function battery_rem_time() {
  acpiconf -i 0 | grep -i -e "Remaining time"
}

function charging_state() {
  acpiconf -i 0 | grep -i -e "State"
}

function cpu_temp() {
  sysctl dev.cpu | grep -i "temperature" 
}

function cpu_freq() {
  sysctl dev.cpu | grep -i "cpu.0.freq:" 
}


function fan_speed() {
  sysctl dev.acpi_ibm.0.fan_speed
}

function print_info() {
  cpu_freq
  cpu_temp

  if $(acpiconf -i 0 &> /dev/null); then
  charging_state
  battery_rem_cap
  battery_rem_time
  fan_speed
  fi
}

if [ "$1" = "-l" ]; then
  while true; do
    clear
    print_info
    sleep 3  
  done
else 
  print_info
fi

