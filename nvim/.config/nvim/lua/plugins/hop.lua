require('hop').setup()

-- 反向查找在代码中有错误的时候无法使用,会报错
-- Keymap({ 'n', 'v' }, 'F', '<Cmd>HopChar1CurrentLineBC<CR>', {})
Keymap({ 'n', 'v' }, 'f', '<Cmd>HopChar1CurrentLineAC<CR>', {})
Keymap({ 'n', 'v' }, 'ff', '<Cmd>HopChar1<CR>')
Keymap({ 'n', 'v' }, 'fl', '<Cmd>HopLineStart<CR>')
