#!/bin/sh

#Create configs directory
mkdir ~/configs -p

# Sym link all aliases to here
for file in .*aliases
do
   echo "Adding alias file ${file}."
   rm "$HOME/configs/${file}" -f
   ln -s "$PWD/${file}" "$HOME/configs/${file}"
done

# Sym link all rc files
for file in .*rc
do
  echo "Adding rc file ${file}."
  rm "$HOME/${file}" -f
  ln "$PWD/${file}" "$HOME/${file}"
done

