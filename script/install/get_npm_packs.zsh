#!/usr/bin/env zsh

zmodload zsh/mapfile

# Installs global npm packages

local os="$(uname)"
local script_path="${0:A:h}"

local pkg_cfg="${script_path}/cfg/npm_pkg.cfg"
local npm_packs=( "${(f)mapfile[$pkg_cfg]}" )



install_npm_packs() {
  for pack in $npm_packs; do
    npm install -g $pack
  done
}

install_npm_packs
