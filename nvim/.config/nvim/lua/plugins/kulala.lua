return {
  'mistweaverco/kulala.nvim',
  ft = { 'http' },
  config = function()
    -- Setup is required, even if you don't pass any options
    require('kulala').setup({})
  end,
}
