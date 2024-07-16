return {
  -- '0x7a7a/bufpin.nvim',
  dir = '~/dev/project/neovim-plugins/bufpin.nvim',
  event = 'VeryLazy',
  enabled = false,
  -- dependencies = {
  --   'nvim-tree/nvim-web-devicons',
  -- },
  config = function()
    local bufpin = require('bufpin')
    bufpin.setup()

    -- stylua: ignore start
    Keymap('n', '<A-1>', function() bufpin.go_to(1) end, { desc = 'BufPin: go to file 1' })
    Keymap('n', '<A-2>', function() bufpin.go_to(2) end, { desc = 'BufPin: go to file 2' })
    Keymap('n', '<A-3>', function() bufpin.go_to(3) end, { desc = 'BufPin: go to file 3' })
    Keymap('n', '<A-4>', function() bufpin.go_to(4) end, { desc = 'BufPin: go to file 4' })
    Keymap('n', '<A-5>', function() bufpin.go_to(5) end, { desc = 'BufPin: go to file 5' })
    Keymap('n', '<C-e>', function() bufpin.toggle() end, { desc = 'BufPin: toggle board' })
    Keymap('n', '<leader>pp', function() bufpin.toggle_pin() end, { desc = 'BufPin: toggle pin' })
    Keymap('n', '<leader>pr', function() bufpin.remove() end, { desc = 'BufPin: remove entry' })
    Keymap('n', '<leader>pa', function() bufpin.remove_all() end, { desc = 'BufPin: remove all entry' })
    Keymap('n', '<A-h>', function() bufpin.prev_pinned() end, { desc = 'BufPin: prev pin' })
    Keymap('n', '<A-l>', function() bufpin.next_pinned() end, { desc = 'BufPin: next pin' })
    -- stylua: ignore end
  end,
}
