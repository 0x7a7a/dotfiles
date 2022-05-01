local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

M.on_attach = function(client, bufnr)
  -- 高亮同名变量
  require('illuminate').on_attach(client)
  vim.api.nvim_command [[ hi def link LspReferenceText CursorLine ]]
  vim.api.nvim_command [[ hi def link LspReferenceWrite CursorLine ]]
  vim.api.nvim_command [[ hi def link LspReferenceRead CursorLine ]]

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local set_buf_keymap = function(mode, lhs, rhs)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
  end

  set_buf_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
  set_buf_keymap('n', 'gD', ':lua lsp_type_definitions<CR>')
  set_buf_keymap('n', 'R', ':lua vim.lsp.buf.rename()<CR>')
  set_buf_keymap('n', '<C-Space>', ':lua vim.lsp.buf.code_action()<CR>')
  set_buf_keymap('i', '<C-Space>', ':lua vim.lsp.buf.code_action()<CR>')
  set_buf_keymap('n', 'gk', ':lua vim.lsp.buf.hover()<CR>')
  set_buf_keymap('n', 'gr', ':Telescope lsp_references<CR>')
  set_buf_keymap('n', '[d', ':lua vim.lsp.diagnostic.goto_prev()<CR>')
  set_buf_keymap('n', ']d', ':lua vim.lsp.diagnostic.goto_next()<CR>')
  -- TODO
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gp', ':preview', opts)

  -- diagnostic float
  vim.api.nvim_create_autocmd('CursorHold', {
    buffer = bufnr,
    callback = function()
      local _opts = {
        focusable = false,
        close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
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
      }
      vim.diagnostic.open_float(nil, _opts)
    end,
  })

  -- autoformat
  if client.resolved_capabilities.document_formatting then
    vim.cmd [[
        augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
        ]]
  end
end

return M
