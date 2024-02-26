### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# must be loaded before the fzf plugin
# https://github.com/jeffreytse/zsh-vi-mode/issues/24
function zvm_config() {
  ZVM_INIT_MODE=sourcing
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
}

### theme p10k
zi ice depth 1  
zi light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### tool
zi wait lucid for \
    OMZP::extract \
 atinit"zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zi light jeffreytse/zsh-vi-mode

zi wait lucid for \
    skywind3000/z.lua \
    Aloxaf/fzf-tab

zi wait lucid from"gh-r" as"null" for \
    sbin"**/lsd" lsd-rs/lsd \
    sbin"*/rg"   BurntSushi/ripgrep \
    sbin"**/fd"  @sharkdp/fd \
    sbin"**/bat" @sharkdp/bat \
    sbin"**/bob" @MordechaiHadad/bob \

zinit pack"default+keys" for fzf

### profile
[ -f ~/.func.sh ] && source ~/.func.sh
[ -f ~/.env.sh ] && source ~/.env.sh
[ -f ~/.alias.sh ] && source ~/.alias.sh

# tmuxifier
eval "$(tmuxifier init -)"
