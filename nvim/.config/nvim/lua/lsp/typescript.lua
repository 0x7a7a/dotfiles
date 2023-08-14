local basic = require('lsp.basic')

require('lspconfig').tsserver.setup({
  capabilities = basic.capabilities,

  on_attach = function(client, bufnr)
    basic.on_attach(client, bufnr)
  end,

  filetypes = {
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
})
