vim.lsp.enable({
  'zls',
  'gopls',
  'luals',
  'tailwindcss',
  'eslint',
  'html',
  'css',
  'volar',
  'vtsls',
  'intelephense',
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

    -- repurpose default nvim lsp bindings to use fzf-lua
    if client:supports_method('textDocument/codeAction') then
      vim.keymap.set('n', 'gra', '<cmd>FzfLua lsp_code_actions previewer=false<CR>', { buffer = true })
    end

    if client:supports_method('textDocument/definition') then
      vim.keymap.set('n', 'gd', '<cmd>FzfLua lsp_definitions<CR>', { buffer = true })
    end

    if client:supports_method('textDocument/declaration') then
      vim.keymap.set('n', 'gD', '<cmd>FzfLua lsp_declarations<CR>', { buffer = true })
    end

    if client:supports_method('textDocument/implementation') then
      vim.keymap.set('n', 'gri', '<cmd>FzfLua lsp_implementations<CR>', { buffer = true })
    end

    if client:supports_method('textDocument/typeDefinition') then
      vim.keymap.set('n', 'gy', '<cmd>FzfLua lsp_typedefs<CR>', { buffer = true })
    end

    if client:supports_method('callHierarchy/incomingCalls') then
      vim.keymap.set('n', 'g(', '<cmd>FzfLua lsp_incoming_calls<CR>', { buffer = true })
    end

    if client:supports_method('callHierarchy/outgoingCalls') then
      vim.keymap.set('n', 'g)', '<cmd>FzfLua lsp_outgoing_calls<CR>', { buffer = true })
    end

    if client:supports_method('textDocument/hover') then
      vim.keymap.set('n', 'K', function()
        vim.lsp.buf.hover({ border = 'rounded', max_height = 10 })
      end, { buffer = true })
    end
  end,
})
