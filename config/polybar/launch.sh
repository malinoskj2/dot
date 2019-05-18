#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


CFG_FILE=$HOME/env/config/polybar/config
# Launch bar1 and bar2
polybar mybar --config=$CFG_FILE &

echo "Bars launched..."
