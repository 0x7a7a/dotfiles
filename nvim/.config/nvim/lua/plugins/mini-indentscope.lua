return {
  'nvim-mini/mini.indentscope',
  event = 'VeryLazy',
  config = function()
    require('mini.indentscope').setup({
      symbol = '│',
      options = { try_as_border = true },
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        'help',
        'neo-tree',
        'lazy',
        'mason',
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
