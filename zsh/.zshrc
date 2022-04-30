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
zinit snippet OMZL::git.zsh
zinit snippet OMZL::history.zsh

zinit wait lucid for \
    OMZP::git \
    OMZP::extract \

### comletion
zinit ice lucid waite=1 as"completion"
zinit snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

### theme
zinit ice depth 1; zinit light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### tool plugin
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zinit light jeffreytse/zsh-vi-mode
zinit wait lucid for \
    skywind3000/z.lua \
    Aloxaf/fzf-tab

zinit wait lucid from"gh-r" as"null" for \
    sbin"**/lsd" Peltoche/lsd \
    sbin"*/rg"   BurntSushi/ripgrep \
    sbin"**/fd"  @sharkdp/fd \
    sbin"**/bat" @sharkdp/bat \
    sbin"fzf"    junegunn/fzf
     # sbin"bin/exa -> exa"  ogham/exa

zinit ice mv"*.zsh -> _fzf" as"completion"
zinit snippet 'https://github.com/junegunn/fzf/blob/master/shell/completion.zsh'
zinit snippet 'https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh'

# fnm
# zinit ice from'gh-r' sbin'fnm' nocompile \
#     atclone"./fnm env --use-on-cd > fnmenv.zsh;./fnm completions --shell zsh > $FPATH/_fnm.zsh" \
#     atpull"%atclone" \
#     multisrc"*.zsh"
# zinit light Schniz/fnm
zinit ice wait lucid from'gh-r' sbin'fnm' nocompile \
    atclone"./fnm env --use-on-cd > fnmenv.zsh" \
    atpull"%atclone" \
    src"fnmenv.zsh"
zinit light Schniz/fnm

# pyenv
# zinit ice atclone'PYENV_ROOT="$PWD" ./libexec/pyenv init - > zpyenv.zsh' \
#     atinit'export PYENV_ROOT="$PWD"' atpull"%atclone" \
#     as'command' pick'bin/pyenv' src"zpyenv.zsh" nocompile'!'
# zinit light pyenv/pyenv

### make command run better
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='fd --type f'
export HISTIGNORE='pwd:exit:fg:bg:top:clear:history:ls:uptime:df'

### profile
[ -f ~/zsh/.func.sh ] && source ~/zsh/.func.sh
[ -f ~/zsh/.env.sh ] && source ~/zsh/.env.sh
[ -f ~/zsh/.alias.sh ] && source ~/zsh/.alias.sh
