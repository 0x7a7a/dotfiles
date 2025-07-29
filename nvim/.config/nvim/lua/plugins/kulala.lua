return {
  'mistweaverco/kulala.nvim',
  ft = { 'http' },
  config = function()
    require('kulala').setup({
      ui = {
        -- split or float
        display_mode = 'split',
        -- vertical or horizontal
        split_direction = 'horizontal',
      },
    })
  end,
}
