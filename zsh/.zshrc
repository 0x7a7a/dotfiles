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
ZVM_INIT_MODE=sourcing

### ohmyzsh plugin
zi snippet OMZL::git.zsh
zi snippet OMZL::history.zsh

zi wait lucid for \
    OMZP::git \
    OMZP::extract \

### comletion
zi ice lucid waite=1 as"completion"
zi snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

### theme
zi ice depth 1; zi light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### tool plugin
zi wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
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
    sbin"**/lsd" Peltoche/lsd \
    sbin"*/rg"   BurntSushi/ripgrep \
    sbin"**/fd"  @sharkdp/fd \
    sbin"**/bat" @sharkdp/bat \
    sbin"fzf"    junegunn/fzf
     # sbin"bin/exa -> exa"  ogham/exa

zi for \
    https://raw.githubusercontent.com/junegunn/fzf/master/shell/{'completion','key-bindings'}.zsh

# fnm
zinit wait lucid for \
    as'completion' \
    atclone"./fnm completions --shell zsh > _fnm.zsh" \
    atload'eval $(fnm env --shell zsh)' \
    atpull'%atclone' \
    blockf \
    from'gh-r' \
    nocompile \
    sbin'fnm' \
  @Schniz/fnm

# pyenv
# zi ice atclone'PYENV_ROOT="$PWD" ./libexec/pyenv init - > zpyenv.zsh' \
#     atinit'export PYENV_ROOT="$PWD"' atpull"%atclone" \
#     as'command' pick'bin/pyenv' src"zpyenv.zsh" nocompile'!'
# zi light pyenv/pyenv

### make command run better
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='fd --type f'
export HISTIGNORE='pwd:exit:fg:bg:top:clear:history:ls:uptime:df'

### profile
[ -f ~/zsh/.func.sh ] && source ~/zsh/.func.sh
[ -f ~/zsh/.env.sh ] && source ~/zsh/.env.sh
[ -f ~/zsh/.alias.sh ] && source ~/zsh/.alias.sh
