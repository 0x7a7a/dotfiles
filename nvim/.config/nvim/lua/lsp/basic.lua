local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

M.on_attach = function(client, bufnr)
  -- automatically highlighting same words
  require('illuminate').on_attach(client)
  vim.api.nvim_command [[ hi def link LspReferenceText CursorLine ]]
  vim.api.nvim_command [[ hi def link LspReferenceWrite CursorLine ]]
  vim.api.nvim_command [[ hi def link LspReferenceRead CursorLine ]]

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local set_buf_keymap = function(mode, lhs, rhs)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
  end

  local dig_float_opts = {
    float = {
      focusable = false,
      close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost', 'QuitPre' },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
      format = function(diagnostic)
        if diagnostic.severity == vim.diagnostic.severity.ERROR and diagnostic.source == 'eslint' then
          return string.format('%s (%s)', diagnostic.message, diagnostic.code)
        end
        return diagnostic.message
      end,
    },
  }
  diagnostic_goto_prev = function()
    vim.diagnostic.goto_prev(dig_float_opts)
  end
  diagnostic_goto_next = function()
    vim.diagnostic.goto_next(dig_float_opts)
  end

  set_buf_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
  set_buf_keymap('n', 'gD', ':lua lsp_type_definitions<CR>')
  set_buf_keymap('n', 'R', ':lua vim.lsp.buf.rename()<CR>')
  set_buf_keymap('n', '<C-Space>', ':lua vim.lsp.buf.code_action()<CR>')
  set_buf_keymap('i', '<C-Space>', ':lua vim.lsp.buf.code_action()<CR>')
  set_buf_keymap('n', 'gk', ':lua vim.lsp.buf.hover()<CR>')
  set_buf_keymap('n', 'gr', ':Telescope lsp_references<CR>')
  set_buf_keymap('n', '[d', ':lua diagnostic_goto_prev()<CR>')
  set_buf_keymap('n', ']d', ':lua diagnostic_goto_next()<CR>')
  -- TODO
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gp', ':preview', opts)

  -- diagnostic float
  vim.api.nvim_create_autocmd('CursorHold', {
    buffer = bufnr,
    callback = function()
      vim.diagnostic.open_float(nil, dig_float_opts.float)
    end,
  })
end

return M
