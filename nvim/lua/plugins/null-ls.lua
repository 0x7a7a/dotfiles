local builtins = require('null-ls').builtins
local utils = require('null-ls.utils').make_conditional_utils()

require('null-ls').setup({
  debug = false,
  sources = {
    -- lua
    builtins.formatting.stylua.with({
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
    builtins.diagnostics.luacheck.with({
      condition = function()
        return vim.fn.executable('luacheck') and utils.root_has_file({ '.luacheckrc' })
      end,
    }),

    -- javascript
    builtins.formatting.prettier.with({
      prefer_local = 'node_modules/.bin',
    }),
    builtins.diagnostics.eslint.with({
      prefer_local = 'node_modules/.bin',
      condition = function()
        local has_eslintd = vim.fn.executable('eslint_d')
        return not has_eslintd and utils.root_has_file({ '.eslintrc.js', '.eslintrc.json', '.eslintrc.yaml' })
      end,
    }),
    builtins.diagnostics.eslint_d.with({
      condition = function()
        return utils.root_has_file({ '.eslintrc.js', '.eslintrc.json', '.eslintrc.yaml' })
      end,
    }),
  },
  --
  -- format files on save
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
    end
  end,
})
