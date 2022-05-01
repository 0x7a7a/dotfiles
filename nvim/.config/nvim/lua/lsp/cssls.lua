local basic = require 'lsp/basic'
basic.capabilities.textDocument.completion.completionItem.snippetSupport = true
require('lspconfig').cssls.setup {
  capabilities = basic.capabilities,
  filetypes = { 'css', 'pcss', 'sass', 'less' },
}
