return {
  'inkarkat/vim-mark',
  dependencies = {
    'inkarkat/vim-ingo-library',
  },
  config = function()
    vim.keymap.set('n', '<leader>M', '<cmd>MarkClear<CR>', { silent = true })
  end,
}
