return {
  'hrsh7th/nvim-cmp',
  -- 'iguanacucumber/magazine.nvim',
  enabled = false,
  event = 'VeryLazy',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'onsails/lspkind-nvim',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip',
    -- 'hrsh7th/cmp-path',
    {
      'FelipeLema/cmp-async-path',
      url = 'https://codeberg.org/FelipeLema/cmp-async-path',
    },
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
    local lspkind = require('lspkind')
    local luasnip = require('luasnip')
    local cmp = require('cmp')

    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
    end

    cmp.setup({
      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.kind,
          cmp.config.compare.exact,
          cmp.config.compare.locality,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
        }),
      },
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-e>'] = cmp.mapping.abort(),

        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            if #cmp.get_entries() == 1 then
              cmp.confirm({ select = true })
            else
              cmp.select_next_item()
            end
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
            if #cmp.get_entries() == 1 then
              cmp.confirm({ select = true })
            end
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      sources = cmp.config.sources({
        {
          name = 'nvim_lsp',
          entry_filter = function(entry, ctx)
            -- Filter the text after the dot symbol
            if ctx.cursor_line:sub(-1, -1) == '.' and entry:get_kind() == 1 then
              return false
            end
            return true
          end,
          priority = 9,
        },
        { name = 'luasnip', priority = 10 },
      }, {
        {
          name = 'buffer',
          priority = 9,
        },
        {
          name = 'async_path',
          priority = 8,
        },
      }),
    })

    -- Automatically add dot after module is confirmed
    -- cmp.event:on('confirm_done', function(ops)
    --   local kind = ops.entry.cache.entries.get_completion_item.kind
    --   -- 9 means cmp_kind is module
    --   if kind == 9 then
    --     vim.api.nvim_put({ '.' }, 'c', true, true)
    --   end
    -- end)

    cmp.setup.cmdline({ '/', '?' }, {
      sources = { {
        name = 'buffer',
      } },
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        -- { name = 'path' },
        { name = 'async_path' },
      }, {
        { name = 'cmdline' },
      }),
    })
  end,
}
