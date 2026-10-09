return {
  'smart-splits-nvim/smart-splits.nvim',
  version = '^3.0.0',
  lazy = false,

  dependencies = {
    {
      'smart-splits-nvim/backend-kitty',
      main = 'smart-splits-backend-kitty',
    },
  },

  opts = {
    mux = {
      backend = 'smart-splits-backend-kitty',
    },
  },

  config = function(_, opts)
    local splits = require('smart-splits')

    splits.setup(opts)

    vim.keymap.set('n', '<C-h>', splits.move_cursor_left)
    vim.keymap.set('n', '<C-j>', splits.move_cursor_down)
    vim.keymap.set('n', '<C-k>', splits.move_cursor_up)
    vim.keymap.set('n', '<C-l>', splits.move_cursor_right)
  end,
}
