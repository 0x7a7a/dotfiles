return {
  'tpope/vim-fugitive',
  event = 'VeryLazy',
  cmd = { 'G', 'Git' },
  keys = {
    { '<leader>G', '<cmd>G<cr>', desc = 'Fugitive: open Menu' },
    { '<leader>gs', '<cmd>G status<cr>', desc = 'Fugitive: git status' },
  },
}
