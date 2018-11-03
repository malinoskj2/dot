#!/usr/bin/env zsh

# Basic env update from git repo

local script_dir=${0:a:h}

git pull -ff origin master

local setup_scripts=( link_cfgs.zsh
	      	      get_node_depends.zsh
	              link_scripts.zsh )

for script in $setup_scripts; do
  $script_dir/$script
done
