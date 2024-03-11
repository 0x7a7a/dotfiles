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
        'gopls',
        'gotests',
        'gofumpt',
        'goimports',
        'goimports-reviser',
        'stylua',
        'eslint_d',
        'prettierd',
        'lua-language-server',
        'vue-language-server',
        'emmet-language-server',
        'svelte-language-server',
        'typescript-language-server',
        'tailwindcss-language-server',
      },
    })
  end,
}
