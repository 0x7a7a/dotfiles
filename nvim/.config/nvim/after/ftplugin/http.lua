vim.api.nvim_buf_set_keymap(0, 'n', '<leader>rr', '<cmd>Rest run<cr>', { desc = 'Run request under the cursor' })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>rl', '<cmd>Rest run last<cr>', { desc = 'Re-run latest request' })

local telescope = require('telescope')
telescope.load_extension('rest')
vim.api.nvim_buf_set_keymap(
  0,
  'n',
  '<leader>rl',
  telescope.extensions.rest.select_env,
  { desc = 'Re-run latest request' }
)
