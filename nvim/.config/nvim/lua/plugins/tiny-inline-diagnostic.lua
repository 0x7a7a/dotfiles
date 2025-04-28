return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy',
  enabled = false,
  config = function()
    require('tiny-inline-diagnostic').setup({
      options = {
        show_source = true,
      },
    })
    vim.diagnostic.config({ virtual_text = false })
  end,
}
