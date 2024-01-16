return {
  'hrsh7th/nvim-cmp',
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
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
          -- Show Source
          -- before = function(entry, vim_item)
          --   vim_item.menu = '[' .. string.upper(entry.source.name) .. ']'
          --   return vim_item
          -- end,
        }),
      },
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
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
        { name = 'nvim_lsp' },
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

    -- Use buffer source for `/`.
    cmp.setup.cmdline({ '/', '?' }, {
      sources = { {
        name = 'buffer',
      } },
    })

    -- Use cmdline & path source for ':'.
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
