return {
  'williamboman/mason.nvim',
  cmd = 'Mason',
  build = ':MasonUpdate', -- :MasonUpdate updates registry contents
  config = function()
    require('mason').setup()
  end,
}
