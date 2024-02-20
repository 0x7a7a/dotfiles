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

    local utils = require('utils')
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
      nmap('ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', '[D]ocument [S]ymbols')

      -- See `:help K` for why this keymap
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation') --use lsp_signature
    end

    local function default_lua_settings()
      return {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              '${3rd}/busted/library',
              '${3rd}/luv/library',
            },
            -- library = vim.api.nvim_get_runtime_file("", true)
          },
        },
      }
    end
    -- https://github.com/neovim/neovim/pull/24592
    require('lspconfig').lua_ls.setup({
      capabilities = capabilities,
      on_attach = custom_attach,
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
          client.config.settings = vim.tbl_deep_extend('force', client.config.settings, default_lua_settings())
          client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
        end
        return true
      end,

      settings = {
        Lua = {
          hint = {
            enable = true,
            setType = true,
          },
        },
      },
    })

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

    -- use lsp eslint instead null-ls eslint
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint
    if vim.fn.executable('eslint') ~= 0 then
      lspconfig.eslint.setup({})
    end

    if vim.fn.executable('tailwindcss-language-server') ~= 0 and utils.npm_is_package_installed('tailwindcss') then
      lspconfig.tailwindcss.setup({})
    end

    -- npm i -g vscode-langservers-extracted
    -- include cssls
    lspconfig.html.setup({
      capabilities = capabilities,
      on_attach = custom_attach,
      filetypes = { 'html', 'svelte' },
    })

    -- vue
    -- https://github.com/vuejs/language-tools/discussions/606
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#volar
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

    if not utils.npm_is_package_installed('svelte') then
      lspconfig.emmet_language_server.setup({})
    end

    -- https://github.com/sveltejs/language-tools/tree/master/packages/typescript-plugin
    -- inlcude emmet
    lspconfig.svelte.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        custom_attach(client, bufnr)

        -- https://github.com/neovim/nvim-lspconfig/issues/725
        -- https://github.com/sveltejs/language-tools/issues/2008
        -- https://www.reddit.com/r/neovim/comments/1598ewp/neovim_svelte/
        -- local group = vim.api.nvim_create_augroup('svelte_ondidchangetsorjsfile', { clear = true })
        -- vim.api.nvim_create_autocmd('BufWritePost', {
        --   group = group,
        --   pattern = { '*.js', '*.ts' },
        --   callback = function(ctx)
        --     -- Here use ctx.match instead of ctx.file
        --     client.notify('$/onDidChangeTsOrJsFile', { uri = ctx.match })
        --   end,
        -- })
        -- vim.api.nvim_create_autocmd({ 'BufWrite' }, {
        --   group = group,
        --   pattern = { '+page.server.ts', '+page.ts', '+layout.server.ts', '+layout.ts' },
        --   command = 'LspRestart svelte',
        -- })
      end,
    })

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
