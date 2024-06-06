-- https://github.com/neovim/nvim-lspconfig/blob/master/README.md
-- https://github.com/mjlbach/starter.nvim/blob/master/init.lua
return {
  'neovim/nvim-lspconfig',
  event = 'BufEnter',
  config = function()
    -- local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
    -- for type, icon in pairs(signs) do
    --   local hl = 'DiagnosticSign' .. type
    --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    -- end
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = ' ',
          [vim.diagnostic.severity.WARN] = ' ',
          [vim.diagnostic.severity.HINT] = ' ',
          [vim.diagnostic.severity.INFO] = ' ',
        },
      },
    })

    local utils = require('utils')
    local lspconfig = require('lspconfig')
    local util = require('lspconfig.util')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local custom_attach = function(_client, bufnr)
      local map = function(...)
        local args = { ... }
        if #args == 3 then
          table.insert(args, 1, { 'n' })
        end

        local mode, keys, func, opts = args[1], args[2], args[3], args[4] or {}
        opts = vim.tbl_extend('keep', opts, { silent = true, buffer = bufnr })
        vim.keymap.set(mode, keys, func, opts)
      end

      if package.loaded['telescope'] then
        local builtin = require('telescope.builtin')
        map('gd', builtin.lsp_definitions, { desc = '[g]oto [d]efinition' })
        map('gD', builtin.lsp_type_definitions, { desc = '[G]oto type [D]eclaration' })
        map('gI', builtin.lsp_implementations, { desc = '[G]oto [I]mplementation' })
        map('gr', builtin.lsp_references, { desc = '[G]oto [R]eferences' })
        map('gs', builtin.lsp_document_symbols, { desc = '[G]oto Document [S]ymbols' })
        map('gA', vim.lsp.buf.code_action, { desc = '[G]oto Code [A]ction' })
      end

      if package.loaded['fzf-lua'] then
        local fzflua = require('fzf-lua')
        map('gd', fzflua.lsp_definitions, { desc = '[G]oto [D]efinition' })
        map('gD', fzflua.lsp_declarations, { desc = '[G]oto type [D]eclaration' })
        map('gI', fzflua.lsp_implementations, { desc = '[G]oto [I]mplementation' })
        map('gr', fzflua.lsp_references, { desc = '[G]oto [R]eferences' })
        map('gs', fzflua.lsp_document_symbols, { desc = '[G]oto Document [S]ymbols' })
        map('gA', fzflua.lsp_code_actions, { desc = '[G]oto Code [A]ctions' })
      end

      map('R', vim.lsp.buf.rename, { desc = 'Rename Variable' })
      map('gh', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
      map('<leader>D', vim.diagnostic.setqflist, { desc = 'Open diagnostics list' })

      map('<C-w>gi', '<C-w>vgi', { desc = 'LSP implementation in window split', remap = true })
      map('<C-w>gd', '<C-w>vgd', { desc = 'LSP definition in window split', remap = true })

      map('[d', vim.diagnostic.jump({ count = -1 }), { desc = 'Previous diagnostic' })
      map(']d', vim.diagnostic.jump({ count = 1 }), { desc = 'Next diagnostic' })
      map('[e', function()
        vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
      end, { desc = 'Previous error diagnostic' })
      map(']e', function()
        vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
      end, { desc = 'Next error diagnostic' })
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
          workspace = {
            library = {
              vim.env.VIMRUNTIME .. '/lua',
              '${3rd}/busted/library',
              '${3rd}/luv/library',
            },
            checkThirdParty = 'Disable',
          },
          diagnostics = {
            unusedLocalExclude = { '_*' },
          },
          hint = {
            enable = true,
            setType = true,
          },
          completion = {
            callSnippet = 'Replace',
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
          usePlaceholders = false,
          staticcheck = true,
          diagnosticsDelay = '500ms',
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
    -- https://www.reddit.com/r/neovim/comments/1bcdm6r/volar_not_showing_errors_in_typescript_files/
    if not utils.npm_is_package_installed('typescript') then
      lspconfig.volar.setup({
        capabilities = capabilities,
        on_attach = custom_attach,
      })
    else
      lspconfig.tsserver.setup({
        capabilities = capabilities,
        on_attach = custom_attach,

        init_options = {
          plugins = {
            {
              name = '@vue/typescript-plugin',
              location = '/usr/local/lib/node_modules/@vue/typescript-plugin',
              languages = { 'javascript', 'typescript', 'vue' },
            },
          },
        },

        filetypes = {
          'javascript',
          'typescript',
          'typescriptreact',
          'typescript.tsx',
          'vue',
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
