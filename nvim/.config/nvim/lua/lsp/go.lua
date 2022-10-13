local basic = require 'lsp/basic'
local util = require 'lspconfig/util'

require('lspconfig').gopls.setup {
  capabilities = basic.capabilities,
  on_attach = function(client, bufnr)
    basic.on_attach(client, bufnr)
  end,

  filetypes = { 'go', 'gomod' },
  message_level = vim.lsp.protocol.MessageType.Error,
  cmd = { 'gopls' },
  root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
  flags = { allow_incremental_sync = true, debounce_text_changes = 1000 },
  settings = {
    gopls = {
      analyses = { unusedparams = true, unreachable = false },
      codelenses = {
        generate = true,
        gc_details = true,
        test = true,
        tidy = true,
      },
      usePlaceholders = true,
      staticcheck = true,
      diagnosticsDelay = '500ms',
      experimentalWatchedFileDelay = '1000ms',
      symbolMatcher = 'fuzzy',
      gofumpt = false, -- turn on for new repos, gofmpt is good but also create code turmoils
    },
  },
}

require('lspconfig').golangci_lint_ls.setup {}
require('go').setup()
