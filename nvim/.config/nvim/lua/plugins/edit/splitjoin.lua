return {
  'Wansmer/treesj',
  keys = { 'gJ', 'gS' },
  config = function()
    require('treesj').setup({ use_default_keymaps = false })
    Keymap('n', 'gJ', require('treesj').join)
    Keymap('n', 'gS', require('treesj').split)
  end,
}
