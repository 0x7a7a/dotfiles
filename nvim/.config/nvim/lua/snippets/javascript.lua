local ls = require('luasnip')
local f = ls.function_node
local postfix = require('luasnip.extras.postfix').postfix

return {
  postfix('.log', {
    f(function(_, parent)
      local match = parent.env.POSTFIX_MATCH
      return "console.log('" .. match .. " is:', " .. match .. ')'
    end),
  }),
}
