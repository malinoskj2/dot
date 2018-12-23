#!/usr/bin/env zsh

echo "$(curl $* | prettyjson)"
