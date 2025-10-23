local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

return {
  s(
    'air',
    fmt(
      [[
    live:
        go run github.com/cosmtrek/air@latest \
        -build.delay "100" \
        -misc.clean_on_exit "true"
  ]],
      {}
    )
  ),

  s(
    { trig = 'gobuildlinux', desc = 'Go build linux amd64' },
    fmt(
      [[
        build-linux:
          GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o {} {}'
      ]],
      {
        i(1, 'appname'),
        i(2, 'main.go'),
      }
    )
  ),

  s(
    { trig = 'sync', desc = 'rsync to remote server' },
    fmt(
      [[
        sync:
          rsync -avz --delete {} {}:{}
      ]],
      {
        i(1, '/path/local'),
        i(2, 'user@remote_server'),
        i(3, '/path/remote'),
      }
    )
  ),
}
