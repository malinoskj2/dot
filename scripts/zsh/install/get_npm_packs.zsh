#!/usr/bin/env zsh

# Installs global npm packages

local os="$(uname)"

local npm_packs=( gtop
		  git-open)

install_crates() {
  for pack in $npm_packs; do
    npm install -g $pack
  done
}
		    
if [[ "$os" = "FreeBSD" || "$os" = "Linux" ]]; then 
  install_crates
fi

