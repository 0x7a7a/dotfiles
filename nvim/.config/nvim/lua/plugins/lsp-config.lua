-- https://github.com/neovim/nvim-lspconfig/blob/master/README.md
-- https://github.com/mjlbach/starter.nvim/blob/master/init.lua
return {
  'neovim/nvim-lspconfig',
  event = 'BufEnter',
  dependencies = { 'saghen/blink.cmp' },
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

    local lspconfig = require('lspconfig')
    local util = require('lspconfig.util')

    -- Refrences/rename/code action is built-in by default
    -- https://github.com/neovim/neovim/pull/28500
    -- vim.keymap.del('n', 'grn')
    -- vim.keymap.del('n', 'grr')
    -- vim.keymap.del({ 'n', 'v' }, 'gra')

    local lsp_keymap = function(bufnr)
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
      map('gri', fzflua.lsp_implementations, { desc = '[G]oto [I]mplementation' })
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

    -- automatically sign up lsp
    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'General LSP Attach',
      callback = function(args)
        -- buf keymap
        lsp_keymap(args.buf)

        -- inlay hints
        -- local client = vim.lsp.get_client_by_id(args.data.client_id)
        -- if client and client.server_capabilities.inlayHintProvider then
        --   vim.lsp.inlay_hint.enable(true)
        -- end
      end,
    })

    local servers = {
      lua_ls = {
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
      },
      gopls = {
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
      },
      tailwindcss = {},
      eslint = {
        on_attach = function(_client, bufnr)
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            command = 'EslintFixAll',
          })
        end,
      },
      html = {
        filetypes = { 'html', 'templ', 'svelte' },
      },
      cssls = {},
      volar = {
        settings = {
          -- emmet = {
          --   showExpandedAbbreviation = 'never',
          -- },
        },
      },
      -- It may cause the blink menu to flicker.
      -- emmet_language_server = {
      --   filetypes = {
      --     'css',
      --     'eruby',
      --     'html',
      --     'vue',
      --     'javascript',
      --     'javascriptreact',
      --     'less',
      --     'sass',
      --     'scss',
      --     'pug',
      --     'typescriptreact',
      --   },
      -- },
      svelte = {},
      rust_analyzer = {
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
      },
      zls = {},
    }

    for server, config in pairs(servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end

    require('typescript-tools').setup({
      filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'vue',
      },

      settings = {
        capabilities = require('blink.cmp').get_lsp_capabilities(),
        tsserver_plugins = {
          '@vue/typescript-plugin',
        },
      },
    })
  end,
}
