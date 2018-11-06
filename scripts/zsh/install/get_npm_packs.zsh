#!/usr/bin/env zsh

# Installs global npm packages

local os="$(uname)"

local npm_packs=( git-open )

local npm_lib=$HOME/.npm/lib
local npm_bin=$HOME/.npm/bin

install_npm_packs() {
  for pack in $npm_packs; do
    npm install --prefix $npm_lib $pack
  done
}

init_node_lib() {
  if [ -d $npm_lib ]; then
    print "npm lib dir already exists \n"
  else
    print "npm lib dir does not exist \ncreating directory \n"
    mkdir $npm_lib
    npm install --prefix $npm_lib
  fi
}

init_node_bin() {
  if [ -d $npm_bin ]; then
    print "npm bin dir already exists \n"
  else
    print "npm bin dir does not exists\ncreating directory \n"
    mkdir $npm_bin
  fi
}

init_node_lib
init_node_bin
install_npm_packs
