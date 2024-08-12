return {
  'mrjones2014/smart-splits.nvim',
  build = './kitty/install-kittens.bash',
  config = function()
    local smart = require('smart-splits')
    smart.setup({})
    -- moving between splits
    vim.keymap.set('n', '<C-h>', smart.move_cursor_left)
    vim.keymap.set('n', '<C-j>', smart.move_cursor_down)
    vim.keymap.set('n', '<C-k>', smart.move_cursor_up)
    vim.keymap.set('n', '<C-l>', smart.move_cursor_right)
  end,
}
