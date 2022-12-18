# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

#ZSH_THEME="dracula-pro"
#ZSH_THEME="robbyrussell"

# Load colors
autoload -U colors
colors
setopt prompt_subst

plugins=(vi-mode)

source "$HOME/configs/aliases.zsh"
source "$HOME/configs/exports.zsh"

source $ZSH/oh-my-zsh.sh

local text_prompt="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}❌)"
PROMPT='%{$fg_bold[blue]%}%~%{$reset_color%} $(git_prompt_info)
 ${text_prompt}%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

unsetopt correct_all

stty -ixon

set termguicolors
autoload -U add-zsh-hook

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. /usr/local/opt/asdf/libexec/asdf.sh
