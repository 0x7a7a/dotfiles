local basic = require('lsp.basic')
require('lspconfig').rust_analyzer.setup({
  capabilities = basic.capabilities,
  on_attach = function(client)
    basic.on_attach(client)
  end,

  settings = {
    ['rust-analyzer'] = {
      assist = {
        importGranularity = 'module',
        importPrefix = 'self',
      },
      cargo = {
        loadOutDirsFromCheck = true,
      },
      procMacro = {
        enable = true,
      },
    },
  },
})
