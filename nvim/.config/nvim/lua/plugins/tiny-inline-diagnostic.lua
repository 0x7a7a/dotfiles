return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy',
  priority = 1000,
  enabled = false,
  config = function()
    require('tiny-inline-diagnostic').setup({
      options = {
        show_source = true,
      },
    })
    vim.diagnostic.config({ virtual_text = false, jump = { float = false } })
  end,
}
