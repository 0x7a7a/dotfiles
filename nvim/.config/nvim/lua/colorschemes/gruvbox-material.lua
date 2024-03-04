return {
  'sainnhe/gruvbox-material',
  lazy = true,
  priority = 1000,
  config = function()
    -- vim.g.gruvbox_material_transparent_background = 1
    vim.g.gruvbox_material_visual = 'reverse'
    vim.g.gruvbox_material_better_performance = 1

    vim.api.nvim_create_autocmd('BufEnter', {
      callback = function()
        vim.opt.cursorline = true
        vim.opt.cursorlineopt = 'number'
        vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = 'orange' })
      end,
    })
  end,
}
