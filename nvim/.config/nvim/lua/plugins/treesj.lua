return {
  'Wansmer/treesj',
  keys = { 'gJ', 'gS' },
  config = function()
    local treesj = require('treesj')
    treesj.setup({ use_default_keymaps = false })
    vim.keymap.set('n', 'gJ', treesj.join)
    vim.keymap.set('n', 'gS', treesj.split)
  end,
}
