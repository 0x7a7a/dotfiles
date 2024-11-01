local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local postfix = require('luasnip.extras.postfix').postfix

return {
  -- Time formatting template
  s({ trig = 'timef', desc = 'Time formatting template' }, { t('"2006-01-02 03:04:05"') }),
  -- Check err
  s(
    { trig = 'ifer', dscr = 'Check err' },
    fmt(
      [[
    if {} != nil {{
      return {}
    }}
    ]],
      { i(1), i(2, 'err') }
    )
  ),
  -- Check if the variable is nil
  postfix('.nn', {
    d(1, function(_, parent)
      return sn(nil, {
        t('if ' .. parent.env.POSTFIX_MATCH .. ' != nil '),
        t({ '{', '\treturn ' }),
        i(1),
        t({ '', '}' }),
      })
    end),
  }),
  postfix('.en', {
    d(1, function(_, parent)
      return sn(nil, {
        t('if ' .. parent.env.POSTFIX_MATCH .. ' == nil '),
        t({ '{', '\treturn ' }),
        i(1),
        t({ '', '}' }),
      })
    end),
  }),
  -- MySql Connect DSN
  s(
    { trig = 'mysqldsn', desc = 'Mysql connect dsn' },
    fmt('"{}:{}@tcp({}:3306)/{}?charset=utf8mb4&parseTime=true&loc=Asia%2FShanghai"', {
      i(1, 'username'),
      i(2, 'password'),
      i(3, 'host'),
      i(4, 'dbname'),
    })
  ),
}
