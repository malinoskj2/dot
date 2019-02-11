#!/usr/bin/env zsh
# Sy s
# Display a few stats about system @ current time 
function battery_rem_cap() {
  acpiconf -i 0 | grep -i -e "Remaining capacity"
} 

function battery_rem_time() {
  acpiconf -i 0 | grep -i -e "Remaining time"
}

function cpu_temp() {
  sysctl hw.acpi.thermal.tz0.temperature
}

function fan_speed() {
  sysctl dev.acpi_ibm.0.fan_speed
}

battery_rem_cap
battery_rem_time
cpu_temp
fan_speed
