return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    require('plugins.tool.telescope.init')
    require('plugins.tool.telescope.finder')
  end,
}
