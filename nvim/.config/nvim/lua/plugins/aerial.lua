require('aerial').setup({
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set('n', '[f', '<cmd>AerialPrev<CR>', { buffer = bufnr })
    vim.keymap.set('n', ']f', '<cmd>AerialNext<CR>', { buffer = bufnr })
  end,

  show_guides = true,
})
Keymap('n', '<Space>a', '<cmd>AerialToggle!<CR>')
