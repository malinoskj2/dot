#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


CFG_FILE=$HOME/env/config/polybar/config
CFG_FILE2=$HOME/env/config/polybar/config2
CFG_FILE3=$HOME/env/config/polybar/config3
# Launch bar1 and bar2
polybar mybar --config=$CFG_FILE &
polybar mybar2 --config=$CFG_FILE2 &
# polybar mybar3 --config=$CFG_FILE3 &

echo "Bars launched..."
