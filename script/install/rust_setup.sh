#!/usr/bin/env zsh


curl https://sh.rustup.rs -sSf | sh -s -- -y &&
rustup component add rustfmt &&
# rustup component add clippy 
