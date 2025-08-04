return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('codecompanion').setup({
      strategies = {
        chat = {
          adapter = 'copilot',
          -- adapter = 'anthropic',
        },
        inline = {
          adapter = 'copilot',
        },
        cmd = {
          adapter = 'copilot',
        },
      },
      adapters = {
        copilot = function()
          return require('codecompanion.adapters').extend('copilot', {
            schema = {
              model = {
                default = 'claude-3.7-sonnet',
                -- default = 'gpt-4.1',
              },
            },
          })
        end,
        anthropic = function()
          return require('codecompanion.adapters').extend('anthropic', {
            env = {
              -- api_key = 'MY_OTHER_ANTHROPIC_KEY',
            },
            model = {
              default = 'Claude Opus 4',
            },
          })
        end,
      },
      opts = {
        language = 'Chinease',
      },
      windows = {
        layout = 'buffer',
      },
    })

    vim.keymap.set({ 'n', 'v' }, '<Space>c', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true })
  end,
}
