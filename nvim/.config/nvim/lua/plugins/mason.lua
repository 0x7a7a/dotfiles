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
        'goimports-reviser',
        'golangci-lint',
        'stylua',
        'css-lsp',
        'html-lsp',
        'eslint-lsp',
        'prettier',
        'emmylua_ls',
        'vue-language-server',
        'typescript-language-server',
        'tailwindcss-language-server',
      },
    })
  end,
}
