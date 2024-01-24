return {
  -- { 'mfussenegger/nvim-lint' },
  -- { 'stevearc/conform.nvim' },
  -- { 'nvimdev/guard.nvim' },

  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require('null-ls')
    local builtins = null_ls.builtins
    local formatter = builtins.formatting
    local linter = builtins.diagnostics
    local utils = require('null-ls.utils').make_conditional_utils()
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    require('null-ls').setup({
      debug = false,
      sources = {
        -- go
        formatter.goimports,
        formatter.goimports_reviser,
        formatter.gofumpt,

        -- lua
        formatter.stylua.with({
          condition = function()
            return vim.fn.executable('stylua')
          end,
          extra_args = function()
            if not utils.root_has_file({ 'stylua.toml', '.stylua.toml' }) then
              return {
                '--config-path',
                vim.fn.expand('~/.config/nvim/stylua.toml'),
              }
            end
          end,
        }),
        linter.luacheck.with({
          condition = function()
            return vim.fn.executable('luacheck') and utils.root_has_file({ '.luacheckrc' })
          end,
        }),

        -- formatter.prettierd,
        formatter.prettierd.with({
          filetypes = {
            'javascript',
            'javascriptreact',
            'typescript',
            'typescriptreact',
            'vue',
            'css',
            'scss',
            'less',
            'html',
            'json',
            'jsonc',
            'yaml',
            'markdown',
            'markdown.mdx',
            'graphql',
            'svelte',
            'handlebars',
          },
        }),

        -- formatter.biome.with({
        --   filetypes = {
        --     'javascript',
        --     'typescript',
        --     'javascriptreact',
        --     'typescriptreact',
        --     'json',
        --     'jsonc',
        --     'css',
        --   },
        --   condition = function()
        --     return vim.fn.executable('biome')
        --   end,
        -- }),
      },

      -- format files on save
      on_attach = function(client, bufnr)
        if client.supports_method('textDocument/formatting') then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })
  end,
}
