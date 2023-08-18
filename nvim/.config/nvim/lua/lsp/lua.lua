local basic = require('lsp.basic')

require('lspconfig').lua_ls.setup({
  on_attach = function(client)
    basic.on_attach(client)
  end,
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
      },
    },
  },
})
