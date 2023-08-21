require('go').setup({
  -- notify: use nvim-notify
  notify = false,
  -- auto commands
  auto_format = true,
  auto_lint = false,
  -- linters: revive, errcheck, staticcheck, golangci-lint
  linter = 'golangci-lint',
  -- linter_flags: e.g., {revive = {'-config', '/path/to/config.yml'}}
  linter_flags = {},
  -- lint_prompt_style: qf (quickfix), vt (virtual text)
  lint_prompt_style = 'qf',
  -- formatter: goimports, gofmt, gofumpt, lsp
  formatter = 'goimports',
  -- maintain cursor position after formatting loaded buffer
  maintain_cursor_pos = false,
  -- test flags: -count=1 will disable cache
  test_flags = { '-v' },
  test_timeout = '30s',
  test_env = {},
  -- show test result with popup window
  test_popup = true,
  test_popup_auto_leave = false,
  test_popup_width = 80,
  test_popup_height = 10,
  -- test open
  test_open_cmd = 'edit',
  -- struct tags
  tags_name = 'json',
  tags_options = { 'json=omitempty' },
  tags_transform = 'snakecase',
  tags_flags = { '-skip-unexported' },
  -- quick type
  quick_type_flags = { '--just-types' },
})

local basic = require('lsp.basic')
local util = require('lspconfig.util')

require('lspconfig').gopls.setup({
  capabilities = basic.capabilities,
  on_attach = function(client)
    basic.on_attach(client)
  end,

  filetypes = { 'go', 'gomod' },
  message_level = vim.lsp.protocol.MessageType.Error,
  cmd = { 'gopls' },
  root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
  flags = { allow_incremental_sync = true, debounce_text_changes = 1000 },
  settings = {
    gopls = {
      analyses = { unusedparams = true, unreachable = false },
      -- codelenses = {
      --   generate = true,
      --   gc_details = true,
      --   test = true,
      --   tidy = true,
      -- },
      usePlaceholders = true,
      staticcheck = true,
      diagnosticsDelay = '500ms',
      symbolMatcher = 'fuzzy',
      gofumpt = false, -- turn on for new repos, gofmpt is good but also create code turmoils
    },
  },
})

if vim.fn.executable('golangci-lint-langserver') then
  require('lspconfig').golangci_lint_ls.setup({})
end
