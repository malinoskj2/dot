#!/usr/bin/env zsh

local file_name=$1
local remote_dir=/Root/temp

local temp_contents=`megals --reload -e $remote_dir | sed 's/.*Root/\/Root/' | tail -n +2 | wc -l`

if [ "$temp_contents" -gt "25" ]; then
    megarm $remote_dir
    megamkdir $remote_dir
fi

megarm "$remote_dir/$file_name" &> /dev/null

megaput --reload --path /Root/temp ${file_name}

local ul_info=$(megals -e $remote_dir | rg $file_name )
print "$ul_info \n"

echo ${ul_info} | sed -e "s/^[ \t]*//" -e 's/[ \t]*\/Root.*//' | xclip -selection c
