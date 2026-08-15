return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    local default_model = 'claude-opus-4-7'
    require('codecompanion').setup({
      adapters = {
        http = {
          opentoken = function()
            return require('codecompanion.adapters').extend('anthropic', {
              url = string.format('%s/v1/messages', os.getenv('OPENTOKEN_API_URL')),
              env = {
                api_key = 'OPENTOKEN_API_KEY',
              },
              schema = {
                model = {
                  default = default_model,
                  choices = { default_model },
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
            model = default_model,
          },
        },
        inline = {
          adapter = 'opentoken',
          model = default_model,
        },
        cmd = {
          adapter = 'opentoken',
          model = default_model,
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
