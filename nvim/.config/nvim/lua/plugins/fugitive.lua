return {
  'tpope/vim-fugitive',
  event = 'VeryLazy',
  cmd = { 'G', 'Git' },
  keys = {
    { '<leader>g', '<Cmd>G<CR>', desc = 'Fugitive: open Menu' },
    { '<leader>gs', '<Cmd>G status<CR>', desc = 'Fugitive: git status' },
  },
}
