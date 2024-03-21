vim.filetype.add({
  extension = { http = 'http' },
})

return {
  {
    'vhyrro/luarocks.nvim',
    branch = 'go-away-python',
    config = function()
      require('luarocks').setup({
        rocks = { 'lua-curl', 'nvim-nio', 'mimetypes', 'xml2lua' },
      })
    end,
  },
  {
    'rest-nvim/rest.nvim',
    ft = 'http',
    config = function()
      require('rest-nvim').setup()
    end,
  },
}
