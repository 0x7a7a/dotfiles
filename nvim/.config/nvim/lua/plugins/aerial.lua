require('aerial').setup({
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set('n', '[f', '<Cmd>AerialPrev<CR>', { buffer = bufnr })
    vim.keymap.set('n', ']f', '<Cmd>AerialNext<CR>', { buffer = bufnr })
  end,

  show_guides = true,

  layout = {
    min_width = 15,
  },
})
