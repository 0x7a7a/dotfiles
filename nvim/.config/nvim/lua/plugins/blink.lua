return {
  'Saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  version = '*',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*',
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
        -- Adapt to kitty terminal,lspkind icons
        kind_icons = {
          Text = '󰉿 ',
          Method = '󰆧 ',
          Function = '󰊕 ',
          Constructor = ' ',
          Field = '󰜢 ',
          Variable = '󰀫 ',
          Class = '󰠱 ',
          Interface = ' ',
          Module = ' ',
          Property = '󰜢 ',
          Unit = '󰑭 ',
          Value = '󰎠 ',
          Enum = ' ',
          Keyword = '󰌋 ',
          Snippet = ' ',
          Color = '󰏘 ',
          File = '󰈙 ',
          Reference = '󰈇 ',
          Folder = '󰉋 ',
          EnumMember = ' ',
          Constant = '󰏿 ',
          Struct = '󰙅 ',
          Event = ' ',
          Operator = '󰆕 ',
          TypeParameter = '󰬛 ',
        },
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

      snippets = {
        expand = function(snippet)
          require('luasnip').lsp_expand(snippet)
        end,
        active = function(filter)
          if filter and filter.direction then
            return require('luasnip').jumpable(filter.direction)
          end
          return require('luasnip').in_snippet()
        end,
        jump = function(direction)
          require('luasnip').jump(direction)
        end,
      },
      sources = {
        default = { 'lsp', 'path', 'luasnip', 'buffer' },
      },
    })
  end,
}
