return {
  'voldikss/vim-floaterm',
  cmd = { 'FloatermNew', 'FloatermToggle' },
  init = function()
    vim.keymap.set('n', '<Space>lg', '<cmd>FloatermNew --title=lazygit --autoclose=2 lazygit<CR>', { silent = true })
    vim.keymap.set('n', '<Space>lf', '<cmd>FloatermNew --title=lf --autoclose=2 lf<CR>', { silent = true })
    -- vim.keymap.set('n', '<Space>t', '<C-\\><C-n>:FloatermToggle<CR>', { silent = true })
    -- vim.keymap.set('t', '<Space>t', '<C-\\><C-n>:FloatermToggle<CR>', { silent = true })
  end,
  config = function()
    vim.g.floaterm_height = 0.95
    vim.g.floaterm_width = 0.95
  end,
}
