return {
  'L3MON4D3/LuaSnip',
  event = 'VeryLazy',
  config = function()
    -- Doc:
    -- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#snipmate
    -- https://evesdropper.dev/files/luasnip/choice-dynamic/
    -- https://www.dmsussman.org/resources/luasnippets/
    -- Tips: Paths must start with'./lua'
    require('luasnip.loaders.from_lua').lazy_load({ paths = './lua/snippets' })
  end,
}
