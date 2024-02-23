return {
  'RRethy/vim-illuminate',
  event = 'VeryLazy',
  config = function()
    vim.g.Illuminate_ftblacklist = { 'NvimTree' }
  end,
}
