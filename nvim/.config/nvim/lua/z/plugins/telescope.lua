return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    require('z.plugins.telescope.init')
    require('z.plugins.telescope.finder')
  end,
}
