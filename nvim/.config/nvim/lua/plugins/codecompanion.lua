return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('codecompanion').setup({
      adapters = {
        http = {
          opentoken = function()
            return require('codecompanion.adapters').extend('anthropic', {
              url = os.getenv('OPENTOKEN_API_URL'),
              env = {
                api_key = 'OPENTOKEN_API_KEY',
              },
              schema = {
                model = {
                  default = 'claude-opus-4-7',
                  choices = { 'claude-opus-4-7' },
                },
              },
            })
          end,
        },
      },
      interactions = {
        chat = {
          adapter = {
            name = 'opentoken',
            model = 'claude-opus-4-7',
          },
        },
        inline = {
          adapter = 'opentoken',
          model = 'claude-opus-4-7',
        },
        cmd = {
          adapter = 'opentoken',
          model = 'claude-opus-4-7',
        },
      },
      opts = {
        language = 'Chinese',
      },
      windows = {
        layout = 'buffer',
      },
    })

    vim.keymap.set({ 'n', 'v' }, '<Space>c', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true })
  end,
}
