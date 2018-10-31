#!/usr/local/bin/zsh

# So I am not manually making sym links

local bin_dir="$HOME/env/scripts/bin"
local scripts=($(find $HOME/env/scripts -name "*.js" | grep -v node_modules | grep -v bin))

for script in $scripts; do
    local base=${$( basename $script)};
    local base_min=${$( basename $script ".js" )};
    print "found node script: $base "
    ln -sf $script $bin_dir/$base_min
    print -P "%(0?.successfully linked as $base_min.failed to link $base) \n"
done


