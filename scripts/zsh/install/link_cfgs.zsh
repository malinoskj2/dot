#!/usr/bin/env zsh

# So I am not manually making sym links

check_exists() {
if [ -e "$1" ]; then
  echo "${$( basename $1)} exists"
else 
  echo "couldn't find ${$( basename $1)}"
fi
}

typeset -A links
links[$HOME/env/x11/.xinitrc]=~/.xinitrc
links[$HOME/env/.zsh/.zshrc]=~/.zshrc
links[$HOME/env/terminal/alacritty.yml]=~/.config/alacritty.yml
links[$HOME/env/git/.gitconfig]=~/.gitconfig

for source dest	in ${(kv)links}; do
    check_exists $source
    ln -sf $source $dest
    print -P "%(0?.successfully linked.failed to link) \n"
done


