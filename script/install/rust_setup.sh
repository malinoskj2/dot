#!/usr/bin/env zsh


curl https://sh.rustup.rs -sSf | sh -s -- -y &&
rustup component add rustfmt 
# rustup component add clippy 
rustup toolchain install stable-x86_64-unknown-freebsd &&
rustup component add rls --toolchain stable-x86_64-unknown-freebsd
