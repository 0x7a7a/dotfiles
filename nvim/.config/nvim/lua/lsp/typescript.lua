local basic = require 'lsp.basic'

require('lspconfig').tsserver.setup {
  capabilities = basic.capabilities,

  on_attach = function(client, bufnr)
    basic.on_attach(client, bufnr)
  end,

  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
}
