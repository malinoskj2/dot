#!/usr/bin/env zsh

SCRIPT_PATH=${0:a:h}

## ${SCRIPT_PATH}/resource.sh && 

/usr/home/jesse/.cargo/bin/yamlink link -c /usr/home/jesse/env/config/config-map.yaml
/usr/home/jesse/.cargo/bin/yamlink link -c /usr/home/jesse/resource/config-map.yaml

## ${SCRIPT_PATH}/npm_setup.sh 
## ${SCRIPT_PATH}/rust_setup.sh && 
