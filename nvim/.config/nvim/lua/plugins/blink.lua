return {
  'Saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  version = '*',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      config = function()
        -- Doc:
        -- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#snipmate
        -- https://evesdropper.dev/files/luasnip/choice-dynamic/
        -- https://www.dmsussman.org/resources/luasnippets/
        -- Tips: Paths must start with'./lua'
        require('luasnip.loaders.from_lua').lazy_load({ paths = './lua/snippets' })
      end,
    },
  },
  config = function()
    require('blink.cmp').setup({
      keymap = {
        preset = 'super-tab',
        ['<CR>'] = { 'accept', 'fallback' },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      completion = {
        menu = {
          draw = {
            columns = {
              { 'label', 'label_description', gap = 1 },
              { 'kind_icon', 'kind' },
            },
          },
        },
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
      },
      signature = { enabled = true },
    })
  end,
}
