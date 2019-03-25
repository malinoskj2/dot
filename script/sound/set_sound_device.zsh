#!/usr/bin/env zsh

ARG1_LEN=${#1}
START_INDEX=$(( ARG1_LEN - 1))

sysctl hw.snd.default_unit="${1[${#1},${#1}]}" 
