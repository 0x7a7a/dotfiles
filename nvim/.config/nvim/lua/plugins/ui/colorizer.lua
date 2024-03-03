return {
  'NvChad/nvim-colorizer.lua',
  ft = { 'css', 'javascript', 'vim', 'html' },
  config = function()
    require('colorizer').setup({ 'css', 'javascript', 'vim', 'html' })
  end,
}
