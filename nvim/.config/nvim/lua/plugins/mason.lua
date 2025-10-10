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
      -- python-lsp: npm install -g @delance/runtime
      ensure_installed = {
        'zls',
        'ruff',
        'gopls',
        'gotests',
        'gotestsum',
        'gofumpt',
        'goimports',
        'goimports-reviser',
        'golangci-lint',
        'stylua',
        'css-lsp',
        'html-lsp',
        'eslint-lsp',
        'prettier',
        'emmylua_ls',
        'vtsls',
        'vue-language-server',
        'typescript-language-server',
        'tailwindcss-language-server',
      },
    })
  end,
}
