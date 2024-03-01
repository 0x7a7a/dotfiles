return {
  'tpope/vim-fugitive',
  cmd = { 'G', 'Git' },
  keys = {
    { '<leader>G', '<cmd>G<cr>', { desc = 'Fugitive' } },
    { '<leader>G', '<cmd>G<cr>', { desc = 'Fugitive' } },
    { '<leader>gs', '<cmd>G status<cr>', { desc = 'Git status' } },
    { '<leader>ga', '<cmd>Gwrite<cr>', { desc = 'Git add' } },
    { '<leader>gc', '<cmd>G commit<cr>', { desc = 'Git commit' } },
    { '<leader>gp', '<cmd>G push<cr>', { desc = 'Git push' } },
  },
}
