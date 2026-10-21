vim.lsp.config('*', {
  capabilities = require('blink.cmp').get_lsp_capabilities(),
})

-- TODO: Change to automatically match the file names in the directory.
vim.lsp.enable({
  'zls',
  'gopls',
  'emmylua_ls',
  'tailwindcss',
  'eslint',
  'html',
  'cssls',
  'vtsls',
  'vue_ls',
  'pyright',
  'ruff',
})

local ERROR = vim.diagnostic.severity.ERROR
local WARN = vim.diagnostic.severity.WARN
local HINT = vim.diagnostic.severity.HINT
local INFO = vim.diagnostic.severity.INFO
vim.diagnostic.config({
  float = {
    source = true,
    prefix = ' ',
    border = 'rounded',
  },
  -- virtual_lines = true,
  virtual_text = true,
  signs = {
    text = {
      [ERROR] = ' ',
      [WARN] = ' ',
      [HINT] = ' ',
      [INFO] = ' ',
    },
  },
})

local function setup_keymaps(bufnr)
  local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, {
      buffer = bufnr,
      silent = true,
      desc = 'LSP: ' .. desc,
    })
  end

  map('n', 'K', function()
    vim.lsp.buf.hover({ border = 'rounded', max_height = 10 })
  end, 'Hover')
  map('n', 'gd', function()
    require('fzf-lua').lsp_definitions()
  end, 'Goto definition')
  map('n', 'gD', function()
    require('fzf-lua').lsp_declarations()
  end, 'Goto declaration')
  map('n', 'gri', function()
    require('fzf-lua').lsp_implementations()
  end, 'Goto implementation')
  map('n', 'grr', function()
    require('fzf-lua').lsp_references()
  end, 'Goto references')
  map('n', 'gs', function()
    require('fzf-lua').lsp_document_symbols()
  end, 'Document symbols')
  map({ 'n', 'x' }, 'grs', function()
    vim.lsp.buf.selection_range('outer')
  end, 'Expand selection')
  map({ 'n', 'x' }, 'grS', function()
    vim.lsp.buf.selection_range('inner')
  end, 'Shrink selection')
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp.attach', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end

    if not vim.b[args.buf].lsp_keymaps_set then
      setup_keymaps(args.buf)
      vim.b[args.buf].lsp_keymaps_set = true
    end

    if client:supports_method('textDocument/documentColor') then
      vim.lsp.document_color.enable(true, { bufnr = args.buf })
    end
  end,
})
