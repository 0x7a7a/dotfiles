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
    vim.keymap.set('n', 'gr', '<Cmd>Telescope lsp_references<CR>', opts)
    vim.keymap.set('n', '<Space>F', '<Cmd>lua vim.lsp.buf.format()<CR>', opts)
    -- vim.keymap.set('n', '<space>f', function()
    --   vim.lsp.buf.format({ async = true })
    -- end, opts)
  end,
})

return {
  'neovim/nvim-lspconfig',
  config = function()
    local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
    vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

    -- it may be override by other plugins
    vim.diagnostic.config({
      virtual_text = false,
      signs = true,
      underline = true,
      update_in_insert = false,
    })

    local lspconfig = require('lspconfig')
    local util = require('lspconfig.util')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    local custom_attach = function(client)
      -- automatically highlighting same words
      require('illuminate').on_attach(client)
    end

    -- configure go server
    lspconfig.gopls.setup({
      capabilities = capabilities,
      on_attach = custom_attach,

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

    -- configure css server
    lspconfig.cssls.setup({
      capabilities = capabilities,
      on_attach = custom_attach,
    })

    -- configure css server
    lspconfig.cssls.setup({
      capabilities = capabilities,
      on_attach = custom_attach,
      filetypes = { 'css', 'pcss', 'sass', 'less' },
    })

    -- configure bash server
    lspconfig.bashls.setup({})

    -- configure eslint server
    -- https://github.com/hrsh7th/vscode-langservers-extracted
    if vim.fn.executable('eslint') ~= 0 then
      lspconfig.eslint.setup({})
    end
    --
    -- configure tailwindcss server
    if vim.fn.executable('tailwindcss-language-server') ~= 0 then
      lspconfig.tailwindcss.setup({})
    end

    -- configure css server
    lspconfig.html.setup({
      capabilities = capabilities,
      on_attach = custom_attach,
    })

    -- configure tsserver server
    lspconfig.tsserver.setup({
      capabilities = capabilities,
      on_attach = custom_attach,

      filetypes = {
        'javascript',
        'typescript',
        'typescriptreact',
        'typescript.tsx',
      },
    })

    -- configure css server
    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
      on_attach = custom_attach,

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
    vim.g.rustfmt_autosave = 1
  end,
}
