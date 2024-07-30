return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  init = function()
    vim.g.gruvbox_material_visual = 'reverse'
    vim.g.gruvbox_material_better_performance = 1
  end,
  config = function()
    Z.autocmd('BufEnter', function()
      vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = 'orange' })
    end)
  end,
}
