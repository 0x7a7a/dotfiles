-- https://github.com/neovim/nvim-lspconfig/blob/master/README.md
-- https://github.com/mjlbach/starter.nvim/blob/master/init.lua
return {
  'neovim/nvim-lspconfig',
  config = function()
    local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    local lspconfig = require('lspconfig')
    local util = require('lspconfig.util')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    local custom_attach = function(client, bufnr)
      -- automatically highlighting same words
      require('illuminate').on_attach(client)

      local attach_opts = { silent = true, buffer = bufnr }

      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, attach_opts)
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, attach_opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, attach_opts)
      vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>')
      -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, attach_opts) -- use lsp_signature
      vim.keymap.set('n', 'R', vim.lsp.buf.rename, attach_opts)
      vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', attach_opts)
      vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, attach_opts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, attach_opts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, attach_opts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, attach_opts)
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
          usePlaceholders = true,
          staticcheck = true,
          diagnosticsDelay = '500ms',
          symbolMatcher = 'fuzzy',
          gofumpt = false, -- turn on for new repos, gofmpt is good but also create code turmoils
        },
      },
    })

    lspconfig.cssls.setup({
      capabilities = capabilities,
      on_attach = custom_attach,
    })

    lspconfig.bashls.setup({})

    if vim.fn.executable('eslint') ~= 0 then
      lspconfig.eslint.setup({})
    end

    if vim.fn.executable('tailwindcss-language-server') ~= 0 then
      lspconfig.tailwindcss.setup({})
    end

    -- npm i -g vscode-langservers-extracted
    lspconfig.html.setup({
      capabilities = capabilities,
      on_attach = custom_attach,
    })

    -- vue
    -- https://github.com/vuejs/language-tools/discussions/606
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#volar
    local utils = require('utils')
    if utils.npm_is_package_installed('vue') then
      lspconfig.volar.setup({
        capabilities = capabilities,
        on_attach = custom_attach,
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      })
    else
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
    end

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
