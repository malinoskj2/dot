#!/usr/bin/env zsh

function install_native() {
  if [ $(uname) = 'FreeBSD' ]; then
    sudo yes | sudo pkg
  elif [ $(uname) = 'Linux' ]; then
    sudo apt-get update &&
    sudo apt update
  fi
}

function install_node() {
  if [ $(uname) = 'FreeBSD' ]; then
    sudo pkg install -y npm node
  elif [ $(uname) = 'Linux' ]; then
    curl -sL https://deb.nodesource.com/setup_10.x | sudo bash - 
    if $?; then
      sudo apt-get install -y nodejs
    fi
  fi 
}

function install_rust() {
  curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly --no-modify-path -y &&
local rustup_path=~/.cargo/bin/rustup

$rustup_path add i686-pc-windows-msvc 
$rustup_path target add wasm32-unknown-unknown
$rustup_path target add x86_64-unknown-freebsd
$rustup_path target add x86_64-unknown-linux-gnu
$rustup_path component add rustfmt
$rustup_path component add clippy-preview --toolchain=nightly

}

install_native
install_node
install_rust  
