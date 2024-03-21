-- events must before lsp client start
return {
  'ray-x/lsp_signature.nvim',
  events = 'LspAttach',
  enabled = false,
  config = function()
    require('lsp_signature').setup({
      floating_window = false,
      toggle_key = '<C-k>',
      -- hint_enable = false,
    })
  end,
}
