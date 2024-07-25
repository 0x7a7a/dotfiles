return {
  'zenbones-theme/zenbones.nvim',
  lazy = true,
  enabled = false,
  init = function()
    vim.g.zenbones_compat = 1
  end,
}
