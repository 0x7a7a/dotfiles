local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local postfix = require('luasnip.extras.postfix').postfix

return {
  -- Check err
  s(
    { trig = 'ife', desc = 'Check err' },
    fmt(
      [[
    if err != nil {{
      {}
    }}
    ]],
      { i(1) }
    )
  ),

  -- Get length of a variable
  postfix('.len', {
    d(1, function(_, parent)
      return sn(nil, { t('len(' .. parent.env.POSTFIX_MATCH .. ')') })
    end),
  }),
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
  -- GoFrame
  s(
    { trig = 'gm', desc = 'g.Meta' },
    fmt('`path:"/v1/{}" tags:"{}" method:"{}" sm:"{}"`', {
      i(1),
      i(2),
      i(3, 'get'),
      i(4),
    })
  ),
  -- Var block
  s(
    { trig = 'vars', desc = 'var block' },
    fmt(
      [[
      var (
        {}
      )
    ]],
      { i(1) }
    )
  ),
  -- Const block
  s(
    { trig = 'consts', desc = 'const block' },
    fmt(
      [[
      const (
        {}
      )
    ]],
      { i(1) }
    )
  ),
  -- Select statement
  s(
    { trig = 'select', desc = 'select statement' },
    fmt(
      [[
      	select {{
	      case {}:
          {}
	      default:
          {}
	      }}
    ]],
      {
        i(1),
        i(2),
        i(3),
      }
    )
  ),
  -- Struct definition
  s(
    { trig = 'types', desc = 'struct definition' },
    fmt(
      [[
      type {} struct {{
        {}
      }}
    ]],
      {
        i(1, 'StructName'),
        i(2),
      }
    )
  ),
  -- Interface definition
  s(
    { trig = 'typei', desc = 'interface definition' },
    fmt(
      [[
      type {} interface {{
        {}
      }}
    ]],
      {
        i(1, 'StructName'),
        i(2),
      }
    )
  ),
  -- For range loop
  s(
    { trig = 'forr', desc = 'for range' },
    fmt(
      [[
      for {}, {} := range {} {{
        {}
      }}
    ]],
      {
        i(1, 'index'),
        i(2, 'value'),
        i(3, 'collection'),
        i(4),
      }
    )
  ),
  -- For index loop
  s(
    { trig = 'fori', desc = 'for index range' },
    fmt(
      [[
      for {} {{
        {}
      }}
    ]],
      {
        i(1, 'condition'),
        i(2),
      }
    )
  ),
  -- Method
  s(
    { trig = 'method', desc = 'method definition' },
    fmt(
      [[
      func ({} {}) {}({}) {}{{
        {}
      }}
    ]],
      {
        i(1, 'receiver'),
        i(2, 'Type'),
        i(3, 'MethodName'),
        i(4),
        i(5),
        i(6),
      }
    )
  ),
}
