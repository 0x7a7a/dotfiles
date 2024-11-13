return {
  'Saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  enabled = false,
  version = 'v0.*',
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

      accept = {
        expand_snippet = vim.snippet.expand,
      },

      highlight = {
        use_nvim_cmp_as_default = true,
      },
      nerd_font_variant = 'mono',
      trigger = {
        signature_help = { enabled = false },
      },

      -- allows extending the enabled_providers array elsewhere in your config
      -- without having to redefining it
      opts_extend = { 'sources.completion.enabled_providers' },
    })
  end,
}
