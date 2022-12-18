#!/bin/sh

export EDITOR='nvim'

STANDARD_PATH=$HOME/.local/bin:$PATH

HEROKU_PATH=/usr/local/heroku/bin
LINUXBREW_PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin
PG_BIN_PATH=/Applications/Postgres.app/Contents/Versions/latest/bin

export PATH=$HEROKU_PATH:$STANDARD_PATH:$LINUXBREW_PATH:$PG_BIN_PATH
export TERM=xterm-256color

# FZF will show dotfiles except for .git/.
# It will still obey the .gitignore folder though
export FZF_DEFAULT_COMMAND='ag --hidden --ignore=".git/*" -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Disable auto updates during brew install
export HOMEBREW_NO_AUTO_UPDATE=1

