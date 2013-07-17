#!/bin/sh

#Create configs directory
mkdir ~/configs -p

# Sym link all aliases to here
for file in .*aliases
do
   echo "Linking alias file ${file}."
   rm "$HOME/configs/${file}" -f
   ln -s "$PWD/${file}" "$HOME/configs/${file}"
done

# Sym link all rc files
for file in .*rc
do
  echo "Linking rc file ${file}."
  rm "$HOME/${file}" -f
  ln -s "$PWD/${file}" "$HOME/${file}"
done

SPECIAL_FILES=".gitk .gitconfig .bash_functions"

# Sys link any other files
for file in $SPECIAL_FILES
do
  echo "Linking special file ${file}."
  rm "$HOME/${file}" -f
  ln -s "$PWD/${file}" "$HOME/${file}"
done

