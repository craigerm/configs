# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Load colors
autoload -U colors
colors
setopt prompt_subst

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source "$HOME/.zsh-aliases.zsh"
source "$HOME/.zsh-exports.zsh"

plugins+=(zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

plugins+=(zsh-autosuggestions)

local text_prompt="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}❌)"
PROMPT='%{$fg_bold[blue]%}%~%{$reset_color%} $(git_prompt_info)
 ${text_prompt}%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

unsetopt correct_all

# stty -ixon

set termguicolors
autoload -U add-zsh-hook

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. /usr/local/opt/asdf/libexec/asdf.sh

# pnpm
export PNPM_HOME="/Users/craig/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#
# Testing new theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
