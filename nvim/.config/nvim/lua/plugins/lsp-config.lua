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
        source = true,
        prefix = ' ',
      },
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

    local npm_installed = Z.npm_installed
    local lspconfig = require('lspconfig')
    local util = require('lspconfig.util')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    -- nvim-ufo setting
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

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

      local fzflua = require('fzf-lua')
      map('gd', fzflua.lsp_definitions, { desc = '[G]oto [D]efinition' })
      map('gD', fzflua.lsp_declarations, { desc = '[G]oto type [D]eclaration' })
      map('gI', fzflua.lsp_implementations, { desc = '[G]oto [I]mplementation' })
      map('gs', fzflua.lsp_document_symbols, { desc = '[G]oto Document [S]ymbols' })
      map('grr', fzflua.lsp_references, { desc = '[G]oto [R]eferences' })

      map('grn', vim.lsp.buf.rename, { desc = 'Rename' })
      map('gh', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
      map('<leader>d', vim.diagnostic.setqflist, { desc = 'Open diagnostics list' })

      map('<C-w>gi', '<C-w>vgi', { desc = 'LSP implementation in window split', remap = true })
      map('<C-w>gd', '<C-w>vgd', { desc = 'LSP definition in window split', remap = true })

      map('[e', function()
        vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
      end, { desc = 'Previous error diagnostic' })
      map(']e', function()
        vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
      end, { desc = 'Next error diagnostic' })
    end

    require('lspconfig').lua_ls.setup({
      capabilities = capabilities,
      on_attach = custom_attach,
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            version = 'LuaJIT',
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              '${3rd}/luv/library',
            },
          },
          diagnostics = {
            unusedLocalExclude = { '_*' },
          },
          hint = {
            enable = true,
            setType = true,
          },
        })
      end,

      settings = {
        Lua = {},
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

    if npm_installed('tailwindcss') then
      lspconfig.tailwindcss.setup({})
    end

    lspconfig.eslint.setup({
      on_attach = function(_client, bufnr)
        vim.api.nvim_create_autocmd('BufWritePre', {
          buffer = bufnr,
          command = 'EslintFixAll',
        })
      end,
    })
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
    local function get_typescript_server_path(root_dir)
      local global_ts = '/home/[yourusernamehere]/.npm/lib/node_modules/typescript/lib'
      -- Alternative location if installed as root:
      -- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
      local found_ts = ''
      local function check_dir(path)
        found_ts = util.path.join(path, 'node_modules', 'typescript', 'lib')
        if util.path.exists(found_ts) then
          return path
        end
      end
      if util.search_ancestors(root_dir, check_dir) then
        return found_ts
      else
        return global_ts
      end
    end
    lspconfig.volar.setup({
      on_new_config = function(new_config, new_root_dir)
        new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
      end,
    })

    local ts_init = {}
    if npm_installed('vue') then
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
    lspconfig.ts_ls.setup({
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

    if not npm_installed('svelte') then
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

    lspconfig.nil_ls.setup({})
  end,
}
