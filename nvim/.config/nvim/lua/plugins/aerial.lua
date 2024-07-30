return {
  'stevearc/aerial.nvim',
  keys = {
    { '<Space>a', '<Cmd>AerialToggle!<CR>', desc = 'Toggle Aerial' },
  },
  config = function()
    require('aerial').setup({
      on_attach = function(_bufnr)
        -- vim.keymap.set('n', '[f', '<Cmd>AerialPrev<CR>', { buffer = bufnr })
        -- vim.keymap.set('n', ']f', '<Cmd>AerialNext<CR>', { buffer = bufnr })
      end,

      show_guides = true,

      layout = {
        min_width = 15,
      },
    })
  end,
}
