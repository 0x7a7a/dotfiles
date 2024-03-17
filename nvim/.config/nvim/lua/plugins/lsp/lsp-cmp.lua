return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'onsails/lspkind-nvim',
    { 'hrsh7th/cmp-buffer', dependencies = 'nvim-cmp' },
    { 'hrsh7th/cmp-path', dependencies = 'nvim-cmp' },
    { 'hrsh7th/cmp-cmdline', dependencies = 'nvim-cmp' },
    { 'saadparwaiz1/cmp_luasnip', dependencies = 'nvim-cmp' },
  },
  config = function()
    local lspkind = require('lspkind')
    local luasnip = require('luasnip')
    local cmp = require('cmp')

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
    end

    cmp.setup({
      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
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
      -- experimental = {
      --   ghost_text = {
      --     hl_group = 'CmpGhostText',
      --   },
      -- },
      mapping = cmp.mapping.preset.insert({
        ['<cr>'] = cmp.mapping.confirm({ select = true }),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),

        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
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

        -- ['<C-j>'] = cmp.mapping(function(fallback)
        --   cmp.mapping.abort()
        --   local copilot_keys = vim.fn['copilot#Accept']()
        --   if copilot_keys ~= '' then
        --     vim.api.nvim_feedkeys(copilot_keys, 'i', true)
        --   else
        --     fallback()
        --   end
        -- end, { 'i', 's' }),
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
        },
        { name = 'luasnip' },
      }, {
        {
          name = 'buffer',
        },
        {
          name = 'path',
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
        { name = 'path' },
      }, {
        { name = 'cmdline' },
      }),
    })
  end,
}
