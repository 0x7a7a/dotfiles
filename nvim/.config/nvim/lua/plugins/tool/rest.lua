vim.filetype.add({
  extension = { http = 'http' },
})

return {
  {
    'vhyrro/luarocks.nvim',
    event = 'VeryLazy',
    branch = 'go-away-python',
    opts = {
      rocks = { 'lua-curl', 'nvim-nio', 'mimetypes', 'xml2lua' },
    },
  },
  {
    'rest-nvim/rest.nvim',
    ft = 'http',
    config = function()
      require('rest-nvim').setup()
    end,
  },
}
