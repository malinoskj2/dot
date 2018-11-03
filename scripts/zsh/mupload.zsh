#!/usr/bin/env zsh

local file_name=$1
local remote_dir=/Root/temp

local temp_contents=`megals -e $remote_dir | sed 's/.*Root/\/Root/' | tail -n +2 | wc -l`

if [ "$temp_contents" -gt "25" ]; then
    megarm $remote_dir
    megamkdir $remote_dir
fi

megarm "$remote_dir/$file_name" &> /dev/null

megaput --reload --path /Root/temp ${file_name}

megals -e $remote_dir | rg $file_name
