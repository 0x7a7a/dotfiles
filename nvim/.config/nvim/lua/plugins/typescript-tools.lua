return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  config = function()
    require('typescript-tools').setup({
      settings = {
        tsserver_plugins = {
          '@vue/typescript-plugin',
        },
      },
      filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'vue',
      },
    })
  end,
}
