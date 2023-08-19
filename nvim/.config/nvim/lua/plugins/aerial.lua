require('aerial').setup({
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set('n', '[f', '<CMD>AerialPrev<CR>', { buffer = bufnr })
    vim.keymap.set('n', ']f', '<CMD>AerialNext<CR>', { buffer = bufnr })
  end,

  show_guides = true,
})
