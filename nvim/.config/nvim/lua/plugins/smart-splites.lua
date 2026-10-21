local is_kitty = vim.env.KITTY_WINDOW_ID ~= nil

return {
  'smart-splits-nvim/smart-splits.nvim',
  version = '^3.0.0',
  lazy = false,
  dependencies = {
    {
      'smart-splits-nvim/backend-kitty',
      main = 'smart-splits-backend-kitty',
      enabled = is_kitty,
    },
  },
  opts = is_kitty and {
    mux = {
      backend = 'smart-splits-backend-kitty',
    },
  } or {},
  config = function(_, opts)
    local splits = require('smart-splits')
    splits.setup(opts)

    vim.keymap.set('n', '<C-h>', splits.move_cursor_left, { desc = 'Move to left split' })
    vim.keymap.set('n', '<C-j>', splits.move_cursor_down, { desc = 'Move to lower split' })
    vim.keymap.set('n', '<C-k>', splits.move_cursor_up, { desc = 'Move to upper split' })
    vim.keymap.set('n', '<C-l>', splits.move_cursor_right, { desc = 'Move to right split' })
  end,
}
