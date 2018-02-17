#!/bin/sh

LOCAL_BINS="diff-highlight diff-so-fancy"
EXTRA_HOME_FILES=".dircolors .gitconfig .gitk .tern-config .bash_functions .eslintrc .rspec .tmux.conf .ctags .editorconfig configure_rspec_colors.rb"

# Sys link files in our curent folder to
# their respective locations
linkfiles(){
  for file in $1
  do
    src="$PWD/${file}"
    dest="$2/${file}"
    echo "Linking ${src} to ${dest}"

    rm "$dest" -f
    ln -s "${src}" "${dest}"
  done
}

#Create configs directory
mkdir ~/configs -p

# Link aliases
linkfiles ".*aliases" "$HOME/configs"

# Link rc files
linkfiles ".*rc" "$HOME"

# Link any desktop files
linkfiles "*.desktop" "/usr/share/applications"

# Link and local bin files
linkfiles "$LOCAL_BINS" "/usr/local/bin"

# Link any extra home files
linkfiles "$EXTRA_HOME_FILES" "$HOME"

# Run any system commands to refresh this
update-desktop-database
chmod a+x /usr/local/bin/cvim

