#!/bin/sh

set -e

# Tyescript
npm install -g typescript typescript-language-server

# HTML, CSS, etc.
npm i -g vscode-langservers-extracted

# Lu
brew install lua-language-server

npm install -g @fsouza/prettierd
