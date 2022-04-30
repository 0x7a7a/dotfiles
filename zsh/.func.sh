# 解析剪切板中的pb
function pb () {
  echo `pbpaste` | xxd -r -p | protoc --decode_raw
}

# 格式化剪切板中的json数据,可能会有精度丢失
function pj() {
  pbpaste | jless
}

# kill进程
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
	echo $pid | xargs kill -${1:-9}
  fi
}
