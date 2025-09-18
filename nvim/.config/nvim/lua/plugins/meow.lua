return {
  'retran/meow.yarn.nvim',
  enabled = false,
  dependencies = { 'MunifTanjim/nui.nvim' },
  config = function()
    require('meow.yarn').setup({
      -- Your custom configuration goes here
    })
  end,
}
