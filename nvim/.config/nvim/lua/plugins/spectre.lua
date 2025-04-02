-- MagicDuck/grug-far.nvim
return {
  'nvim-pack/nvim-spectre',
  enabled = false,
  keys = {
    { '<Space>S', '<cmd>lua require("spectre").toggle()<CR>', desc = 'Toggle Spectre' },
  },
}
