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
  jump = {
    float = true,
  },
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

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end

    if client:supports_method('textDocument/hover') then
      vim.keymap.set('n', 'K', function()
        vim.lsp.buf.hover({ border = 'rounded', max_height = 10 })
      end, { buffer = true })
    end

    if client:supports_method('textDocument/foldingRange') then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
    end

    if client:supports_method('textDocument/selectionRange') then
      vim.keymap.set({ 'n', 'x' }, 'grs', "<cmd>vim.lsp.buf.selection_range('outer')<CR>", { buffer = true })
      vim.keymap.set({ 'n', 'x' }, 'grS', "<cmd>vim.lsp.buf.selection_range('inner')<CR>", { buffer = true })
    end

    if client:supports_method('textDocument/documentColor') then
      vim.lsp.document_color.enable(true, { bufnr = args.buf })
    end
  end,
})
