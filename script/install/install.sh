#!/usr/bin/env zsh

SCRIPT_PATH=${0:a:h}

## ${SCRIPT_PATH}/resource.sh && 

/usr/home/jesse/.cargo/bin/yamlink /usr/home/jesse/env -t dot -c config-map.yaml
/usr/home/jesse/.cargo/bin/yamlink /usr/home/jesse/resource -c config-map.yaml

## ${SCRIPT_PATH}/npm_setup.sh 
## ${SCRIPT_PATH}/rust_setup.sh && 
