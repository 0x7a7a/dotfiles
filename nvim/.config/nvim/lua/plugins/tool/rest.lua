vim.filetype.add({
  extension = { http = 'http' },
})

return {
  'rest-nvim/rest.nvim',
  ft = 'http',
  dependencies = {
    {
      'vhyrro/luarocks.nvim',
      priority = 1000,
      config = true,
      opts = {
        rocks = { 'lua-curl', 'nvim-nio', 'mimetypes', 'xml2lua' },
      },
    },
  },
  config = function()
    require('rest-nvim').setup()
  end,
}

-- vim-test
-- vimux
