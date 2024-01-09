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

        -- json
        -- formatter.biome.with({
        --   condition = function()
        --     return vim.fn.executable('biome')
        --   end
        -- }),

        -- javascript
        formatter.dprint.with({
          prefer_local = 'node_modules/.bin',
        }),

        -- use lsp eslint instead null-ls eslint
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint

        -- linter.eslint_d.with({
        --   method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
        --   condition = function()
        --     return utils.root_has_file({ '.eslintrc.js', '.eslintrc.json', '.eslintrc.yaml' })
        --   end,
        -- }),
        -- linter.eslint.with({
        --   prefer_local = 'node_modules/.bin',
        --   method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
        --   condition = function()
        --     local has_eslintd = vim.fn.executable('eslint_d')
        --     local has_eslint_fils = utils.root_has_file({ '.eslintrc.js', '.eslintrc.json', '.eslintrc.yaml' })
        --
        --     return not has_eslintd and has_eslint_fils
        --   end,
        -- }),
        -- builtins.code_actions.eslint_d,
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
