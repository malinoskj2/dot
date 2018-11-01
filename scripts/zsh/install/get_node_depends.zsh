#!/usr/bin/env zsh

# fetch node dependencies


local script_dirs=($(find $HOME/env/scripts -name "package.json" | grep -v node_modules | sed 's/\/package.json//'))


for dir in $script_dirs; do
    local script="$(echo $dir/*js)"
    local script_name=${$( basename $script)};

    print $script_name
    print "installing @ $dir"
    npm install --prefix $dir 
    print -PN "%(0?.installed dependencies successfully.failed to install dependencies ) \n"

done


