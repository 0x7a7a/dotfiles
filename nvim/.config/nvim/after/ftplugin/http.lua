vim.api.nvim_buf_set_keymap(0, 'n', '<leader>rr', '<cmd>Rest run<cr>', { desc = 'Run request under the cursor' })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>rl', '<cmd>Rest run last<cr>', { desc = 'Re-run latest request' })

require('telescope').load_extension('rest')
vim.api.nvim_buf_set_keymap(
  0,
  'n',
  '<leader>re',
  '<cmd>lua require("telescope").extensions.rest.select_env()<cr>',
  { desc = 'Telescope Rest Env' }
)
