return {
  'L3MON4D3/LuaSnip',
  event = 'VeryLazy',
  config = function()
    -- DOC https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#snipmate
    -- Snipmate examples: https://github.com/honza/vim-snippets
    -- Paths must start with'./lua'
    require('luasnip.loaders.from_snipmate').lazy_load({ paths = './lua/snippets/snipmate' })
  end,
}
