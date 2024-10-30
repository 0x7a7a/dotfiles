return {
  'L3MON4D3/LuaSnip',
  event = 'VeryLazy',
  config = function()
    -- DOC https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#snipmate
    -- Paths must start with'./lua'
    require('luasnip.loaders.from_lua').lazy_load({ paths = './lua/snippets' })
  end,
}
