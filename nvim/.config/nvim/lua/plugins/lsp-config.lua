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

      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { silent = true, buffer = bufnr, desc = desc })
      end

      nmap('R', vim.lsp.buf.rename)
      nmap('gd', function()
        require('telescope.builtin').lsp_definitions()
      end, '[G]oto [D]efinition')
      nmap('gD', require('telescope.builtin').lsp_type_definitions, '[G]oto type [D]eclaration')
      nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
      nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      nmap('gs', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

      -- See `:help K` for why this keymap
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation') --use lsp_signature
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
