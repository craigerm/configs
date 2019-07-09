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

linkfiles(){
  mkdir -p "$2"
  find "$1" -type f | while read file; do linkfile $file $2; done
}

#Create configs directory
mkdir -p ~/configs

linkfiles "home-files" "$HOME"
linkfiles "aliases" "$HOME/configs"
linkfiles "colors" "$HOME/.vim/bundle/vim-colorschemes/colors"
linkfiles "bins" "/usr/local/bin"

## Link any desktop files
##linkfiles "*.desktop" "/usr/share/applications"
#linkfile "gtk.css" "$HOME/.config/gtk-3.0"

# Run any system commands to refresh this
#update-desktop-database
#chmod a+x /usr/local/bin/cvim


echo "\nConfiguration installed!"
