return {
  -- '0x7a7a/bufpin.nvim',
  dir = '~/dev/project/neovim-plugins/bufpin.nvim',
  event = 'VeryLazy',
  enabled = false,
  config = function()
    local bufpin = require('bufpin')
    bufpin.setup()

    -- stylua: ignore start
    vim.keymap.set('n', '<A-1>', function() bufpin.go_to(1) end, { desc = 'BufPin: go to file 1' })
    vim.keymap.set('n', '<A-2>', function() bufpin.go_to(2) end, { desc = 'BufPin: go to file 2' })
    vim.keymap.set('n', '<A-3>', function() bufpin.go_to(3) end, { desc = 'BufPin: go to file 3' })
    vim.keymap.set('n', '<A-4>', function() bufpin.go_to(4) end, { desc = 'BufPin: go to file 4' })
    vim.keymap.set('n', '<A-5>', function() bufpin.go_to(5) end, { desc = 'BufPin: go to file 5' })
    vim.keymap.set('n', '<C-e>', function() bufpin.toggle() end, { desc = 'BufPin: toggle board' })
    vim.keymap.set('n', '<leader>pp', function() bufpin.toggle_pin() end, { desc = 'BufPin: toggle pin' })
    vim.keymap.set('n', '<leader>pr', function() bufpin.remove() end, { desc = 'BufPin: remove entry' })
    vim.keymap.set('n', '<leader>pa', function() bufpin.remove_all() end, { desc = 'BufPin: remove all entry' })
    vim.keymap.set('n', '<A-h>', function() bufpin.prev_pinned() end, { desc = 'BufPin: prev pin' })
    vim.keymap.set('n', '<A-l>', function() bufpin.next_pinned() end, { desc = 'BufPin: next pin' })
    -- stylua: ignore end
  end,
}
