return {
  'junegunn/vim-easy-align',
  config = function()
    Keymap({ 'n', 'x' }, 'ga', '<Plug>(EasyAlign)')
  end,
}
