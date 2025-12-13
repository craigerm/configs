#!/bin/sh

set -e

linkfile(){
  echo "Linking files in $1 to $2"
  filename=$(basename $1)
  src="$(pwd)/$1"
  dest="$2/$filename"
  rm -f "$dest"
  ln -s "${src}" "${dest}"
}

linkfile_rename (){
  echo "Linking files in $1 to $2"
  filename=$(basename $1)
  src="$(pwd)/$1"
  dest="$2"
  rm -f "$dest"
  ln -s "${src}" "${dest}"
}

linkfiles(){
  mkdir -p "$2"
  find "$1" -type f | while read file; do linkfile $file $2; done
}

#Create configs directory
mkdir -p "$HOME/configs"
mkdir -p "$HOME/.config/nvim/lua/pack-config"
mkdir -p "$HOME/.config/lazygit"
mkdir -p "$HOME/.config/ghostty"

linkfiles "home-files" "$HOME"
linkfiles "zsh" "$HOME"

#linkfiles "bins" "/usr/local/bin"
#linkfiles "nvim" "$HOME/.config/nvim"

# Link manually
linkfile "nvim/init.lua" "$HOME/.config/nvim"
linkfile "nvim/vars.lua" "$HOME/.config/nvim/lua"
linkfile "nvim/opts.lua" "$HOME/.config/nvim/lua"
linkfile "nvim/keys.lua" "$HOME/.config/nvim/lua"
linkfile "nvim/pack.lua" "$HOME/.config/nvim/lua"
linkfile "nvim/cmds.lua" "$HOME/.config/nvim/lua"

linkfile "other/ghostty/config" "$HOME/.config/ghostty"

# Link all pack config files
linkfiles "nvim/pack-config" "$HOME/.config/nvim/lua/pack-config"
