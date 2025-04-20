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
      jump = {
        float = true,
      },
      float = {
        source = true,
        prefix = ' ',
        border = 'rounded',
      },
      -- virtual_lines = true,
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
    vim.lsp.inlay_hint.enable()

    local lspconfig = require('lspconfig')
    local util = require('lspconfig.util')

    -- automatically sign up lsp
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
          return
        end

        -- repurpose default nvim lsp bindings to use fzf-lua
        if client:supports_method('textDocument/codeAction') then
          vim.keymap.set('n', 'gra', '<cmd>FzfLua lsp_code_actions previewer=false<CR>', { buffer = true })
        end

        if client:supports_method('textDocument/definition') then
          vim.keymap.set('n', 'gd', '<cmd>FzfLua lsp_definitions<CR>', { buffer = true })
        end

        if client:supports_method('textDocument/declaration') then
          vim.keymap.set('n', 'gD', '<cmd>FzfLua lsp_declarations<CR>', { buffer = true })
        end

        if client:supports_method('textDocument/implementation') then
          vim.keymap.set('n', 'gri', '<cmd>FzfLua lsp_implementations<CR>', { buffer = true })
        end

        if client:supports_method('textDocument/typeDefinition') then
          vim.keymap.set('n', 'gy', '<cmd>FzfLua lsp_typedefs<CR>', { buffer = true })
        end

        if client:supports_method('callHierarchy/incomingCalls') then
          vim.keymap.set('n', 'g(', '<cmd>FzfLua lsp_incoming_calls<CR>', { buffer = true })
        end

        if client:supports_method('callHierarchy/outgoingCalls') then
          vim.keymap.set('n', 'g)', '<cmd>FzfLua lsp_outgoing_calls<CR>', { buffer = true })
        end

        if client:supports_method('textDocument/hover') then
          vim.keymap.set('n', 'K', function()
            vim.lsp.buf.hover({ border = 'rounded', max_height = 10 })
          end, { buffer = true })
        end

        if client:supports_method('textDocument/foldingRange') then
          local win = vim.api.nvim_get_current_win()
          vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end
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
            hints = {
              constantValues = true,
              functionTypeParameters = true,
            },
            staticcheck = true,
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
      volar = {},
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
      intelephense = {},
    }

    for server, config in pairs(servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end,
}
