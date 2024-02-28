return {
  'tpope/vim-fugitive',
  cmd = { 'G', 'Git' },
  config = function()
    Keymap('n', '<leader>G', '<cmd>G<cr>', { desc = 'Fugitive' })
    Keymap('n', '<leader>gs', '<cmd>G status<cr>', { desc = 'Git status' })
    Keymap('n', '<leader>ga', '<cmd>Gwrite<cr>', { desc = 'Git add' })
    Keymap('n', '<leader>gc', '<cmd>G commit<cr>', { desc = 'Git commit' })
    Keymap('n', '<leader>gp', '<cmd>G push<cr>', { desc = 'Git push' })
  end,
}
