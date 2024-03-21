return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  enabled = false,
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('noice').setup({
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      cmdline = {
        enabled = false,
      },
      messages = {
        enabled = false,
      },
    })
  end,
}
