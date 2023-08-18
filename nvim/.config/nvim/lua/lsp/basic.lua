-- diagnostic hover
vim.api.nvim_command([[ hi def link LspReferenceText CursorLine ]])
vim.api.nvim_command([[ hi def link LspReferenceWrite CursorLine ]])
vim.api.nvim_command([[ hi def link LspReferenceRead CursorLine ]])

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

vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    vim.diagnostic.open_float(nil, dig_float_opts.float)
  end,
})

-- Global mappings.
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'R', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'i' }, '<C-Space>', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gk', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>', opts)
    vim.keymap.set('n', '<Space>F', ':lua vim.lsp.buf.format()<CR>', opts)
    -- vim.keymap.set('n', '<space>f', function()
    --   vim.lsp.buf.format({ async = true })
    -- end, opts)
  end,
})

-- common attach
local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

M.on_attach = function(client)
  -- automatically highlighting same words
  require('illuminate').on_attach(client)
end

return M
