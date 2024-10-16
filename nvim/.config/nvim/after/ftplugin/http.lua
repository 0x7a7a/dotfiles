vim.api.nvim_set_keymap('n', '<leader>hp', ":lua require('kulala').jump_prev()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hn', ":lua require('kulala').jump_next()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hr', ":lua require('kulala').run()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  'n',
  '<leader>hh',
  ":lua require('kulala').toggle_view()<CR>",
  { noremap = true, silent = true }
)
