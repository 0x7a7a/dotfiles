return {
  'stevearc/aerial.nvim',
  keys = {
    { '<Space>a', '<Cmd>AerialToggle!<CR>', desc = 'Toggle Aerial' },
    { '[f', '<Cmd>AerialPrev<CR>', desc = 'Prev Function' },
    { ']f', '<Cmd>AerialNext<CR>', desc = 'Next Fcuntion' },
  },
  config = function()
    require('aerial').setup({
      show_guides = true,
      layout = {
        min_width = 15,
      },
    })
  end,
}
