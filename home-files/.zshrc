# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Load colors
autoload -U colors
colors
setopt prompt_subst

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(vi-mode)

log "function:start"
. ~/.bash_functions
log "function:end"

log "zshsource:start"
source $ZSH/oh-my-zsh.sh
log "zshsource:end"

log "aliases:start"
# Include aliases after zsh so we can override any default aliases
. ~/configs/.linux_aliases
. ~/configs/.git_aliases
. ~/configs/.bash_aliases
log "aliases:end"

# Misc unicode chars
# ✈ ➜ ☺

local mainIcon="%(?,%{$fg[green]%}>%{$reset_color%},%{$fg[red]%}X%{$reset_color%})"

log "rvmsession:start"
# This loads RVM into a shell session
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  .
log "rvmsession:end"

# Customize theme variables
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=") %{$fg[green]%}✔%{$reset_color%}"

PROMPT='
%{$fg_bold[white]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} $(vi_mode_prompt_info)
 ${mainIcon}%{$reset_color%} '

RPROMPT='%{$fg[white]%}(node-`nvm current`)%{$fg[white]%} ($(~/.rvm/bin/rvm-prompt))%{$fg[red]%} ⚡ %{$fg[yellow]%}$(git_hash) %{$reset_color%}'

unsetopt correct_all

export EDITOR='nvim'

# Make sure ctrl-d doesn't exit, unless you press it 42 times
#export IGNOREEOF=42

#export TERM=screen-256color
#export TERM=xterm-256color

STANDARD_PATH=$PATH:/home/craig/.local/bin
ANDROID_PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
HEROKU_PATH=/usr/local/heroku/bin
LINUXBREW_PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin
EB_PATH=$HOME/.ebcli-virtual-env/executables
FLUTTER_PATH=$HOME/code/libs/flutter/bin

export PATH=$HEROKU_PATH:$STANDARD_PATH:$LINUXBREW_PATH:$EB_PATH:$FLUTTER_PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

stty -ixon

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  # Set the colors (solarized) We'll see if we like it...
  eval `dircolors $HOME/.dircolors`
fi

export TERM=xterm-256color
#set termguicolors
#set termguicolors

# Load a specific version of node
#nvm use 5.6.0 > /dev/null
#rvm use 2.1.4

#DISABLE_CORRECTION="true"
#
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    #echo "Reverting to nvm default version"
    #nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

cd .

# FZF will show dotfiles except for .git/. It will still obey the .gitignore folder though
export FZF_DEFAULT_COMMAND='ag --hidden --ignore=".git/*" -g ""'
#export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#fpath=($fpath "/home/craig/.zfunctions")

## Set Spaceship ZSH as a prompt
#autoload -U promptinit; promptinit
#prompt spaceship
