return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  tag = 'v17.33.0',
  config = function()
    require('codecompanion').setup({
      strategies = {
        chat = {
          adapter = {
            name = 'copilot',
            model = 'claude-sonnet-4',
          },
        },
        inline = {
          adapter = 'copilot',
        },
        cmd = {
          adapter = 'copilot',
        },
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
