return {
  'tpope/vim-fugitive',
  event = 'VeryLazy',
  cmd = { 'G', 'Git' },
  keys = {
    { '<leader>ge', '<cmd>Gedit<CR>', desc = 'Gedit' },
    { '<leader>gp', '<cmd>G pull<CR>', desc = 'Git pull' },
    { '<leader>gl', '<cmd>Gclog<CR>', desc = 'Git log' },
    { '<leader>gg', '<cmd>G<CR>', desc = 'Git menu' },
    { '<leader>gb', '<cmd>G blame<CR>', desc = 'Git blame' },
    { '<leader>gs', '<cmd>G status<CR>', desc = 'Git status' },
  },
}
