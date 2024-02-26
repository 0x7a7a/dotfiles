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

ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Must before $ZIM_HOME/init.zsh
# Must be loaded before the fzf plugin
# Will affect the load speed a bit
# https://github.com/jeffreytse/zsh-vi-mode/issues/24
# function zvm_config() {
#   ZVM_INIT_MODE=sourcing
#   ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
#   ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
# }

# Load plugins.
source $ZIM_HOME/init.zsh

source ~/.p10k.zsh

# Profile
[ -f ~/.func.sh ] && source ~/.func.sh
[ -f ~/.env.sh ] && source ~/.env.sh
[ -f ~/.alias.sh ] && source ~/.alias.sh

eval "$(tmuxifier init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
