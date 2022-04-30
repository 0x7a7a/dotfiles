# go
export GO111MODULE=auto
export GOPROXY="https://goproxy.io,direct"
export GOROOT=/usr/local/go
export GOPATH=~/dev/gopath
MYGODEV=~/dev/mygo/bin
# rust
RUSTPATH=~/.cargo/bin
MYSQL=/usr/local/opt/mysql-client/bin
NGINXPATH=/usr/local/opt/openresty/nginx/sbin

PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$MYGODEV:$NGINXPATH:MYSQL:$RUSTPATH
