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

#linkfiles "home-files" "$HOME"
#linkfiles "zsh" "$HOME/configs"
#linkfiles "colors" "$HOME/.vim/bundle/vim-colorschemes/colors"
#linkfiles "bins" "/usr/local/bin"
#
#linkfiles "nvim" "$HOME/.config/nvim"

# Link manually
linkfile "nvim/init.lua" "$HOME/.config/nvim"
linkfile "nvim/vars.lua" "$HOME/.config/nvim/lua"
linkfile "nvim/opts.lua" "$HOME/.config/nvim/lua"
linkfile "nvim/keys.lua" "$HOME/.config/nvim/lua"
linkfile "nvim/plug.lua" "$HOME/.config/nvim/lua"
linkfile "nvim/config-nvim-tree.lua" "$HOME/.config/nvim/lua"
linkfile "nvim/config-fzf-lua.lua" "$HOME/.config/nvim/lua"

#linkfile "other/coc-settings.json" "$HOME/.config/nvim"

## Link any desktop files
##linkfiles "*.desktop" "/usr/share/applications"

# Run any system commands to refresh this
#update-desktop-database
#chmod a+x /usr/local/bin/cvim

#
# Simple check for required eibs
#
#brew install the_silver_searcher
#apt-get install silversearcher-ag
#which ag

echo "\nConfiguration installed!"
