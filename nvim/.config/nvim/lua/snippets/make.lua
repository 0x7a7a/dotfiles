local ls = require('luasnip')
local s = ls.snippet
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
}
