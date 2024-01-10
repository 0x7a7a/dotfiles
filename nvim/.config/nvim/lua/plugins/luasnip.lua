return {
  'L3MON4D3/LuaSnip',
  dependencies = { 'rafamadriz/friendly-snippets' },
  config = function()
    require('luasnip.loaders.from_vscode').lazy_load()
    -- Must start with. / lua
    require('luasnip.loaders.from_snipmate').lazy_load({ paths = './lua/snippets/snipmate' })
    require('luasnip.loaders.from_lua').lazy_load({ paths = './lua/snippets/luasnip' })
  end,
}
