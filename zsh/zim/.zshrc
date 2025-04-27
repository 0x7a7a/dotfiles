ZIM_HOME=~/.zim
zstyle ':zim:zmodule' use 'degit'
if [[ ! -e $ZIM_HOME/zimfw.zsh ]]; then
  # Download zimfw script if missing.
  curl -fsSLo $ZIM_HOME/zimfw.zsh --create-dirs \
    https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi
if [[ ! $ZIM_HOME/init.zsh -nt ~/.zimrc ]]; then
  # Install missing modules and update $ZIM_HOME/init.zsh.
  source $ZIM_HOME/zimfw.zsh init
fi

# Activate Powerlevel10k Instant Prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export FZF_DEFAULT_COMMAND='fd --type f'
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Must be loaded before the fzf plugin
# https://github.com/jeffreytse/zsh-vi-mode/issues/24
zvm_after_init(){
  which fzf &>/dev/null && source <(fzf --zsh)
}

# Emacs-style keybinding
bindkey -e

# Load plugins.
source $ZIM_HOME/init.zsh

source ~/.p10k.zsh

#
# ------------- Personal Config ---------------
#
#ZVIM
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZVM_VI_EDITOR=nvim

## Lf default editor
export EDITOR=nvim
export MANPAGER='nvim +Man!'

## fz setting
FZ_HISTORY_CD_CMD=_zlua
FZ_CASE_INSENSITIVE=0

path=(
  $HOME/go/bin
  $HOME/.cargo/bin
  $HOME/.zvm/bin
  $HOME/.krew/bin
  $HOME/.zvm/self
  $HOME/.local/share/bob/nvim-bin
  $HOME/.local/share/nvim/mason/bin
  /usr/local/opt/mysql-client/bin
  /usr/local/opt/openresty/nginx/sbin
  /usr/local/sbin
  $path
)

alias ..='cd ..'
alias ...='cd ../..'

alias ls='lsd'
alias l='ls -l'
alias ll='ls -l'
alias lla='ls -la'
alias la='ls -a'
alias lt='ls --tree'

alias nv='nvim'
alias v='nvim'
alias lg='lazygit'
alias kc='kubectl'
alias grep='rg'
alias find='fd'

alias tr='trash'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias mkdir='mkdir -pv'
alias genv='printenv | rg -i'

alias up='brew update && brew upgrade && zimfw update -v && bob update nightly'

PROXY='http://127.0.0.1:7890'
alias proxy='export http_proxy=$PROXY https_proxy=$PROXY'
alias noproxy='unset http_proxy https_proxy'

alias gf=gf
