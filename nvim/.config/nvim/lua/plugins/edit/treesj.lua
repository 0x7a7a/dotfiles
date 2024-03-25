return {
  'Wansmer/treesj',
  keys = { 'gJ', 'gS' },
  config = function()
    local treesj = require('treesj')
    treesj.setup({ use_default_keymaps = false })
    Keymap('n', 'gJ', treesj.join)
    Keymap('n', 'gS', treesj.split)
  end,
}
