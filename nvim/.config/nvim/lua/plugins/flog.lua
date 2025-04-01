return {
  'rbong/vim-flog',
  dependencies = {
    'tpope/vim-fugitive',
  },
  lazy = true,
  cmd = { 'Flog', 'Flogsplit', 'Floggit' },
  keys = {
    { '<leader>gf', '<cmd>Flog<CR>', desc = 'Flog' },
  },
}
