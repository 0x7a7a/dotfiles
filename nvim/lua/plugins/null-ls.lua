local utils = require('null-ls.utils').make_conditional_utils()

require('null-ls').setup({
  debug = false,
  sources = {
    require('null-ls').builtins.formatting.stylua.with({
      extra_args = function()
        if not utils.root_has_file({ 'stylua.toml', '.stylua.toml' }) then
          return {
            '--config-path',
            vim.fn.expand('~/.config/nvim/stylua.toml'),
          }
        end
      end,
    }),
    require('null-ls').builtins.formatting.prettier.with({
      prefer_local = 'node_modules/.bin',
    }),

    require('null-ls').builtins.diagnostics.eslint.with({
      prefer_local = 'node_modules/.bin',
    }),
  },
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
