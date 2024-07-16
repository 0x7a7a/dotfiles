return {
  'chrishrb/gx.nvim',
  keys = { { 'gx', '<cmd>Browse<cr>', mode = { 'n', 'x' } } },
  cmd = { 'Browse' },
  init = function()
    vim.g.netrw_nogx = 1 -- disable netrw gx
  end,
  dependencies = { 'nvim-lua/plenary.nvim' },
  submodules = false, -- not needed, submodules are required only for tests
  opts = {},
}
