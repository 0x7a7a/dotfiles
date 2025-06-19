-- https://github.com/neovim/nvim-lspconfig/blob/master/README.md
-- https://github.com/mjlbach/starter.nvim/blob/master/init.lua
return {
  'neovim/nvim-lspconfig',
  event = 'BufEnter',
  dependencies = { 'saghen/blink.cmp' },
  config = function()
    local lspconfig = require('lspconfig')
    local util = require('lspconfig.util')

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
          -- https://github.com/golang/tools/blob/master/gopls/doc/settings.md#analyses-mapstringbool
          gopls = {
            analyses = {
              ST1000 = false,
              ST1003 = false,
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
      vue_ls = {},
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
