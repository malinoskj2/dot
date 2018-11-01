#!/usr/bin/env zsh

# So I am not manually making sym links

local bin_dir="$HOME/env/scripts/bin"
local scripts=($(find $HOME/env/scripts -name "*.js" | grep -v node_modules | grep -v bin))

if [ -d $bin_dir ]; then
     print "bin directory already exists"
 else
     print "bin directory does not exist, creating \n"
     mkdir $bin_dir
     print -P "%(0?.successfully created bin directory.failed to create bin dir \n"
fi      

for script in $scripts; do
    local base=${$( basename $script)};
    local base_min=${$( basename $script ".js" )};
    
    echo "source: $script"
    echo "dest: $bin_dir/$base_min"

    print "found node script: $base "
    ln -sf $script "$bin_dir/$base_min"
    print -P "%(0?.successfully linked as $base_min.failed to link $base) \n"
done


