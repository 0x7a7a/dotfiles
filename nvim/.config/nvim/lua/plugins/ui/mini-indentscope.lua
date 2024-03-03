return {
  'echasnovski/mini.indentscope',
  event = 'VeryLazy',
  version = '*',
  config = function()
    require('mini.indentscope').setup()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'help',
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
