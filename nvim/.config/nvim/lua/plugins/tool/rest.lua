vim.filetype.add({
  extension = { http = 'http' },
})

return {
  'rest-nvim/rest.nvim',
  ft = 'http',
  dependencies = {

    'vhyrro/luarocks.nvim',
    branch = 'go-away-python',
    opts = {
      rocks = { 'lua-curl', 'nvim-nio', 'mimetypes', 'xml2lua' },
    },
    config = function()
      require('rest-nvim').setup()
    end,
  },
}
