return {
  'RRethy/vim-illuminate',
  events = 'VeryLazy',
  config = function()
    vim.g.Illuminate_ftblacklist = { 'NvimTree' }
  end,
}
