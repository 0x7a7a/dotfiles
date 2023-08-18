local basic = require('lsp.basic')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').html.setup({
  capabilities = capabilities,

  on_attach = function(client)
    basic.on_attach(client)
  end,
})
