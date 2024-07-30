-- https://github.com/neovim/nvim-lspconfig/blob/master/README.md
-- https://github.com/mjlbach/starter.nvim/blob/master/init.lua
return {
  'neovim/nvim-lspconfig',
  event = 'BufEnter',
  config = function()
    local ERROR = vim.diagnostic.severity.ERROR
    local WARN = vim.diagnostic.severity.WARN
    local HINT = vim.diagnostic.severity.HINT
    local INFO = vim.diagnostic.severity.INFO
    vim.diagnostic.config({
      float = {
        close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
        focusable = false,
        prefix = ' ',
        source = 'if_many',
      },
      virtual_text = {
        min = ERROR,
        max = ERROR,
      },
      signs = {
        text = {
          [ERROR] = ' ',
          [WARN] = ' ',
          [HINT] = ' ',
          [INFO] = ' ',
        },
      },
    })
    -- vim.auto('CursorHold', function()
    --   vim.diagnostic.open_float()
    -- end)

    local utils = require('utils')
    local lspconfig = require('lspconfig')
    local util = require('lspconfig.util')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    -- Refrences/rename/code action is built-in by default
    -- https://github.com/neovim/neovim/pull/28500
    -- vim.keymap.del('n', 'grn')
    -- vim.keymap.del('n', 'grr')
    -- vim.keymap.del({ 'n', 'v' }, 'gra')

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
        map('gs', builtin.lsp_document_symbols, { desc = '[G]oto Document [S]ymbols' })
        map('grr', builtin.lsp_references, { desc = '[G]oto [R]eferences' })
      end

      if package.loaded['fzf-lua'] then
        local fzflua = require('fzf-lua')
        map('gd', fzflua.lsp_definitions, { desc = '[G]oto [D]efinition' })
        map('gD', fzflua.lsp_declarations, { desc = '[G]oto type [D]eclaration' })
        map('gI', fzflua.lsp_implementations, { desc = '[G]oto [I]mplementation' })
        map('gs', fzflua.lsp_document_symbols, { desc = '[G]oto Document [S]ymbols' })
        map('grr', fzflua.lsp_references, { desc = '[G]oto [R]eferences' })
      end

      map('grn', vim.lsp.buf.rename, { desc = 'Rename' })
      map('gh', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
      map('<leader>D', vim.diagnostic.setqflist, { desc = 'Open diagnostics list' })

      map('<C-w>gi', '<C-w>vgi', { desc = 'LSP implementation in window split', remap = true })
      map('<C-w>gd', '<C-w>vgd', { desc = 'LSP definition in window split', remap = true })

      map('[d', function()
        vim.diagnostic.jump({ count = -1 })
      end, { desc = 'Previous diagnostic' })
      map(']d', function()
        vim.diagnostic.jump({ count = 1 })
      end, { desc = 'Next diagnostic' })
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
        },
      },
    })

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

    -- use lsp eslint instead null-ls eslint
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint
    if vim.fn.executable('eslint') ~= 0 then
      lspconfig.eslint.setup({})
    end

    if utils.npm_pkg_installed('tailwindcss') then
      lspconfig.tailwindcss.setup({})
    end

    lspconfig.html.setup({
      capabilities = capabilities,
      on_attach = custom_attach,
      filetypes = { 'html', 'templ', 'svelte' },
    })
    lspconfig.cssls.setup({
      capabilities = capabilities,
      on_attach = custom_attach,
    })

    -- Vue language server
    -- https://github.com/vuejs/language-tools/issues/3925
    -- https://github.com/williamboman/mason-lspconfig.nvim/issues/371
    -- https://www.reddit.com/r/neovim/comments/1bib0v3/help_vuelanguageserver_setup_with_kickstartmason/
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vue-support
    lspconfig.volar.setup({
      init_options = {
        vue = {
          hybridMode = false,
        },
      },
    })

    local ts_init = {}
    if utils.npm_pkg_installed('vue') then
      ts_init = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = '/usr/local/lib/node_modules/@vue/typescript-plugin',
            languages = { 'vue' },
          },
        },
      }
    end
    lspconfig.tsserver.setup({
      capabilities = capabilities,
      on_attach = custom_attach,

      init_options = ts_init,

      filetypes = {
        'javascript',
        'typescript',
        'typescriptreact',
        'vue',
      },
    })

    if not utils.npm_pkg_installed('svelte') then
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

    lspconfig.zls.setup({
      capabilities = capabilities,
      on_attach = custom_attach,
    })
  end,
}
