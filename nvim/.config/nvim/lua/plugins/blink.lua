return {
  'saghen/blink.cmp',
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
        ['<C-c>'] = { 'hide', 'fallback' },
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
        list = {
          selection = {
            preselect = function(ctx)
              return ctx.mode ~= 'cmdline'
            end,
            auto_insert = true,
          },
        },
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
      snippets = { preset = 'luasnip' },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'markdown' },
        providers = {
          markdown = {
            name = 'RenderMarkdown',
            module = 'render-markdown.integ.blink',
            fallbacks = { 'lsp' },
          },
        },
      },

      cmdline = {
        keymap = {
          preset = 'enter',
          -- recommended, as the default keymap will only show and select the next item
          ['<Tab>'] = { 'show', 'accept' },
        },
        completion = {
          list = {
            selection = {
              preselect = false,
              auto_insert = true,
            },
          },
          menu = {
            auto_show = true,
          },
        },
      },
    })
  end,
}
