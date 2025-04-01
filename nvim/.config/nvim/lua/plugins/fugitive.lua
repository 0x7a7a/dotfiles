return {
  'tpope/vim-fugitive',
  event = 'VeryLazy',
  cmd = { 'G', 'Git' },
  keys = {
    { '<leader>g', '<cmd>G<CR>', desc = 'Fugitive: open Menu' },
    { '<leader>gs', '<cmd>G status<CR>', desc = 'Fugitive: git status' },
  },
}
