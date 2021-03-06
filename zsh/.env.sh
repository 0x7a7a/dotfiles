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

PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$MYGODEV:$NGINXPATH:MYSQL:$RUSTPATH
