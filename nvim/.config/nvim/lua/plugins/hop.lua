require('hop').setup()

Keymap({ 'n', 'v' }, 'f', '<Cmd>HopChar1CurrentLineAC<CR>', {})
Keymap({ 'n', 'v' }, 'F', '<Cmd>HopChar1CurrentLineBC<CR>', {})
Keymap({ 'n', 'v' }, 'ff', '<Cmd>HopChar1<CR>')
Keymap({ 'n', 'v' }, 'fl', '<Cmd>HopLineStart<CR>')
