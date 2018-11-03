#!/usr/bin/env zsh

# So I am not manually making sym links

local bin_dir="$HOME/env/scripts/bin"

local js_scripts=($(find $HOME/env/scripts -name "*.js" | grep -v node_modules | grep -v bin))

local zsh_scripts=($HOME/env/scripts/zsh/*(.))


create_bin_dir() {
  if [ -d $bin_dir ]; then
    print "bin directory already exists"
  else
    print "bin directory does not exist, creating \n"
    mkdir $bin_dir
    print -P "%(0?.successfully created bin directory.failed to create bin dir \n"
  fi      
}

link_js_scripts() {
  for script in $js_scripts; do
    local base=${$( basename $script)};
    local base_min=${$( basename $script ".js" )};
    
    echo "source: $script"
    echo "dest: $bin_dir/$base_min"

    print "found node script: $base "
    ln -sf $script "$bin_dir/$base_min"
    print -P "%(0?.successfully linked as $base_min.failed to link $base) \n"
  done
}

create_bin_dir
link_js_scripts
