#!/usr/bin/env zsh

# Check if all args were supplied
if [ $# -lt 3 ]; then
  echo "please supply all arguments e.g.: \"./tshark_def re0 tcp 443\"" 
  exit 1;
fi

# make directory to save captures if it doesnt exist
if [ ! -d "/tmp/tshark" ]; then
  mkdir /tmp/tshark
fi

SESSION_TIME=$(date +%s)
CAP_INTERFACE=$1
CAP_PROTOCOL=$2
CAP_PORT=$3
EXTRA_ARGS=$(echo $@[4,-1])

tshark -P \
-i $CAP_INTERFACE \
-f "${CAP_PROTOCOL} port ${CAP_PORT}" \
-w "/tmp/tshark/session_${SESSION_TIME}.pcap"

echo "session ended" 
