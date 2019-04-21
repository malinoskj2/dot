# Created by jesse for 5.6.2

ZSH_CFG_DIR=$HOME/env/zsh
ZSH_MOD_DIR=$HOME/env/zsh/mod

# load funcs
cfg_files=(
    $ZSH_CFG_DIR/zsh_var
    $ZSH_CFG_DIR/zsh_path
    $ZSH_CFG_DIR/zsh_alias
    $ZSH_CFG_DIR/zsh_setting
)

# compile and load cfg files
for cfg_file ($cfg_files) {
  if [ -f $cfg_file ]; then
   #zcompile $cfg_file;
    source $cfg_file;
  else
    echo "$cfg_file does not exist"
  fi
}
# load module functions
zmodules=(
 prompt_j2
)


for mod ($zmodules) {
  
  local mod_path=${ZSH_MOD_DIR}/${mod}

  if [ -f "${mod_path}/${mod}_loader" ]; then
    
    setopt EXTENDED_GLOB
    for file in ${mod_path}/^*.zwc(.); do 
	# zcompile $file
    done 
    unsetopt EXTENDED_GLOB

    source "${mod_path}/${mod}_loader"  
  else
    echo "The modules loader was not found"
  fi
}

