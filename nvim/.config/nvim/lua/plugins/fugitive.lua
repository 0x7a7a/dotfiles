return {
  'tpope/vim-fugitive',
  event = 'VeryLazy',
  cmd = { 'G', 'Git' },
  keys = {
    { '<leader>gg', '<cmd>G<CR>', desc = 'Fugitive: open Menu' },
    { '<leader>gb', '<cmd>G blame<CR>', desc = 'Fugitive: git blame' },
    { '<leader>gs', '<cmd>G status<CR>', desc = 'Fugitive: git status' },
  },
}
