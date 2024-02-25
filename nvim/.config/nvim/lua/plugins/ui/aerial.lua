return {
  'stevearc/aerial.nvim',
  keys = {
    { '<Space>a', '<cmd>AerialToggle!<cr>', desc = 'Toggle Aerial' },
  },
  config = function()
    require('aerial').setup({
      on_attach = function(_bufnr)
        -- vim.keymap.set('n', '[f', '<cmd>AerialPrev<cr>', { buffer = bufnr })
        -- vim.keymap.set('n', ']f', '<cmd>AerialNext<cr>', { buffer = bufnr })
      end,

      show_guides = true,

      layout = {
        min_width = 15,
      },
    })
  end,
}
