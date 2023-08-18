local basic = require('lsp.basic')

require('lspconfig').tsserver.setup({
  capabilities = basic.capabilities,

  on_attach = function(client)
    basic.on_attach(client)
  end,

  filetypes = {
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
})
