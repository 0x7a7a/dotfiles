return {
  'danymat/neogen',
  event = 'BufEnter',
  enabled = false,
  config = function()
    require('neogen').setup({
      enabled = true,
      -- snippet_engine = 'luasnip',
    })
    Keymap('n', '<leader>nc', ":lua require('neogen').generate()<CR>")
  end,
}
