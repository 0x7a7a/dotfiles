-- DOC https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#snipmate
return {
  'L3MON4D3/LuaSnip',
  dependencies = { 'rafamadriz/friendly-snippets' },
  config = function()
    require('luasnip.loaders.from_vscode').lazy_load()
    -- Must start with. / lua
    -- Snipmate examples: https://github.com/honza/vim-snippets
    require('luasnip.loaders.from_snipmate').lazy_load({ paths = './lua/snippets/snipmate' })
    require('luasnip.loaders.from_lua').lazy_load({ paths = './lua/snippets/luasnip' })
  end,
}
