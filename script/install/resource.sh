#!/usr/bin/env zsh

typeset -A resources

resources[https://github.com/malinoskj2/resource]="/usr/home/jesse/resource"
resources[https://github.com/malinoskj2/binary]="/usr/home/jesse/binary"

for src dest in ${(kv)resources}; do
    git clone $src $dest
    echo "$src -> $dest"
done

/usr/home/jesse/app/yamlink /usr/home/jesse/resource -c config-map.yaml
