return {
  '0x7a7a/gx.nvim',
  -- dir = '/Users/lucky/dev/project/neovim-plugins/gx.nvim',
  keys = { { 'gx', '<Cmd>Browse<CR>', mode = { 'n', 'x' } } },
  cmd = { 'Browse' },
  init = function()
    vim.g.netrw_nogx = 1 -- disable netrw gx
  end,
  dependencies = { 'nvim-lua/plenary.nvim' },
  submodules = false, -- not needed, submodules are required only for tests
  opts = {},
}
