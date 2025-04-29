return {
  'williamboman/mason.nvim',
  dependencies = {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  event = 'BufEnter',
  build = ':MasonUpdate',
  config = function()
    require('mason').setup()
    require('mason-tool-installer').setup({
      ensure_installed = {
        'zls',
        'gopls',
        'gotests',
        'gotestsum',
        'gofumpt',
        'golangci-lint',
        'stylua',
        'css-lsp',
        'html-lsp',
        'eslint-lsp',
        'prettier',
        'lua-language-server',
        'vue-language-server',
        'typescript-language-server',
        'tailwindcss-language-server',
      },
    })
  end,
}
