return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  enabled = false,
  config = function()
    require('typescript-tools').setup({
      filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'vue',
      },

      settings = {
        capabilities = require('blink.cmp').get_lsp_capabilities(),
        tsserver_plugins = {
          '@vue/typescript-plugin',
        },
      },
    })
  end,
}
