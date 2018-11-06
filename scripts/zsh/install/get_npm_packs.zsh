#!/usr/bin/env zsh

zmodload zsh/mapfile

# Installs global npm packages

local os="$(uname)"
local script_path="${0:A:h}"

local pkg_cfg="${script_path}/cfg/npm_pkg.cfg"
local npm_packs=( "${(f)mapfile[$pkg_cfg]}" )

local npm_lib=$HOME/.npm/lib

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

init_node_lib
install_npm_packs
