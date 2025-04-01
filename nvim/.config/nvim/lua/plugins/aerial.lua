return {
  'stevearc/aerial.nvim',
  keys = {
    { '<Space>a', '<cmd>AerialToggle!<CR>', desc = 'Toggle Aerial' },
    { '[f', '<cmd>AerialPrev<CR>', desc = 'Prev Function' },
    { ']f', '<cmd>AerialNext<CR>', desc = 'Next Fcuntion' },
  },
  config = function()
    require('aerial').setup({
      show_guides = true,
      layout = {
        min_width = 15,
        default_direction = 'prefer_left',
      },
    })
  end,
}
