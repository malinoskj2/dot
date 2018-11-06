#!/usr/bin/env zsh

zmodload zsh/mapfile # Allows mapping of file to array

# Check to see if desired cargo crates are already installed. 
# Attempt to install them via cargo if they arent.

local os="$(uname)"
local cargo_bin="${HOME}/.cargo/bin"

local script_path="${0:A:h}"
local crate_cfg="${script_path}/cfg/crates.cfg"
local cargo_crates=( "${(f)mapfile[$crate_cfg]}" )

install_crates() {
  for crate in $cargo_crates; do
    if [ -e "${cargo_bin}/${crate}" ]; then
      print "$crate is already installed \n";
    else
      print "$crate is not installed\nAttempting to install. \n"
      cargo install $crate
    fi
  done
}
		    
if [[ "$os" = "FreeBSD" || "$os" = "Linux" ]]; then 
  install_crates
fi

