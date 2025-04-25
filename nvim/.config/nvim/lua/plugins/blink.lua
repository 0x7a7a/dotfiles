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
    { 'fang2hou/blink-copilot' },
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
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
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
        default = { 'lsp', 'path', 'snippets', 'buffer', 'markdown', 'copilot' },
        providers = {
          copilot = {
            name = 'copilot',
            module = 'blink-copilot',
            score_offset = 100,
            async = true,
          },
          markdown = {
            name = 'RenderMarkdown',
            module = 'render-markdown.integ.blink',
            fallbacks = { 'lsp' },
          },
        },
      },

      cmdline = {
        keymap = {
          preset = 'cmdline',
          ['<Tab>'] = {
            function(cmp)
              if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then
                return cmp.accept()
              end
            end,
            'show_and_insert',
            'select_next',
          },
          ['<S-Tab>'] = { 'show_and_insert', 'select_prev' },
        },
        completion = {
          list = {
            selection = {
              preselect = false,
              auto_insert = true,
            },
          },
          menu = {
            auto_show = function(_ctx)
              return vim.fn.getcmdtype() == ':' or vim.fn.getcmdtype() == '@'
            end,
          },
        },
      },
    })
  end,
}
