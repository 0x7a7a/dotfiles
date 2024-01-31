# go
export GO111MODULE=auto
export GOWORK=off
export GOPROXY="https://goproxy.cn/,direct"
export GOROOT=/usr/local/go
export GOPATH=~/dev/gopath
MYGODEV=~/dev/mygo/bin
# rust
RUSTPATH=~/.cargo/bin

MYSQL=/usr/local/opt/mysql-client/bin
NGINXPATH=/usr/local/opt/openresty/nginx/sbin
export KUBECONFIG=$HOME/.kube/config.d/pro:$HOME/.kube/config

#bob,neovim version control
BOB=~/.local/share/bob/nvim-bin

#mason
MASON=~/.local/share/nvim/mason/bin

#mise
MISE=~/.local/share/mise/shims

#tmuxifier
TMUXIFIERPATH=$HOME/.tmux/plugins/tmuxifier/bin

PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$MYGODEV:$NGINXPATH:$MYSQL:$RUSTPATH:$MASON:$MISE:$BOB:$TMUXIFIERPATH
