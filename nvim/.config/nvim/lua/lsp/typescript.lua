local basic = require 'lsp/basic'

require('lspconfig').tsserver.setup {
  capabilities = basic.capabilities,

  on_attach = function(client, bufnr)
    basic.on_attach(client, bufnr)

    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end,
}
