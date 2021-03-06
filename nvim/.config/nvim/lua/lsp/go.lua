local basic = require 'lsp/basic'
local util = require 'lspconfig/util'

require('lspconfig').gopls.setup {
  capabilities = basic.capabilities,
  on_attach = function(client, bufnr)
    basic.on_attach(client, bufnr)
  end,

  filetypes = { 'go', 'gomod', 'gohtmltmpl', 'gotexttmpl' },
  message_level = vim.lsp.protocol.MessageType.Error,
  cmd = {
    'gopls',
    -- 'server',
  },
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
      completeUnimported = true,
      staticcheck = true,
      matcher = 'fuzzy',
      diagnosticsDelay = '500ms',
      experimentalWatchedFileDelay = '1000ms',
      symbolMatcher = 'fuzzy',
      gofumpt = false, -- true, -- turn on for new repos, gofmpt is good but also create code turmoils
      buildFlags = { '-tags', 'integration' },
      -- buildFlags = {"-tags", "functional"}
    },
  },
}

-- require('lspconfig').golangci_lint_ls.setup({})
