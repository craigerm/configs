#!/bin/sh

# Misc utils
alias l='ls -lAh'
alias reload='source ~/.zshrc'
alias c='clear'
alias xx='exit'

# Editor aliases
alias nvim='/Users/craig/code/packages/nvim/bin/nvim'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

# Elixir/Phoenix
alias dp='iex -S mix phx.server'
alias dt='iex -S mix test --trace'
alias d='iex -S mix'
alias p='mix phx.server'
alias t='mix test'

alias notify="osascript -e 'display notification \"You are notified!\"'"

#  Processes
alias fp='ps aux | grep'
alias kp='kill -9'

# Git misc
alias g='lazygit'

# Git commits
alias pb='git push origin HEAD'
alias ca='git commit --amend --no-edit'
alias cm='git commit -m'

# Git changes
alias f='git fetch'
alias s='git status --short'
alias gst='git status'
alias gs='git status'
alias dc='git diff --cached'
alias dd='git diff'
alias ap='git add -p'

# Git branches
alias b='git branch'
alias ba='git branch -a'
alias co='git checkout'

# Git logs
alias gl='git log --graph --pretty=format":%C(yellow)%h%C(bold magenta)%d%Creset %s %C(white) %an, %ar%Creset"'
alias lg='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold magenta)<%an>%Creset" --abbrev-commit --date=relative'
alias l='git log --pretty=format:"%C(yellow)%h%Creset - %s %C(magenta bold)(%cr by %an)"'
