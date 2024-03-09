return {
  'ThePrimeagen/harpoon',
  enabled = false,
  event = 'VeryLazy',
  branch = 'harpoon2',
  -- stylua: ignore
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup()

    Keymap('n', '<A-1>', function() harpoon:list():select(1) end)
    Keymap('n', '<A-2>', function() harpoon:list():select(2) end)
    Keymap('n', '<A-3>', function() harpoon:list():select(3) end)
    Keymap('n', '<A-4>', function() harpoon:list():select(4) end)
    Keymap('n', '<A-5>', function() harpoon:list():select(5) end)
    Keymap('n', '<A-6>', function() harpoon:list():select(6) end)
    Keymap('n', '<A-7>', function() harpoon:list():select(7) end)
    Keymap('n', '<A-8>', function() harpoon:list():select(8) end)
    Keymap('n', '<A-9>', function() harpoon:list():select(9) end)

    Keymap('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'toggle harpoon menu' })
    Keymap('n', '<leader>a', function() harpoon:list():append() end, { desc = 'add the file to harpoon menu' })
    Keymap('n', '<leader>d', function() harpoon:list():remove() end, { desc = 'remove file in harpoon menu' })
    Keymap('n', '<leader>hc', function()  harpoon:list():clear() end, { desc = 'clear harpoon menu' })
    Keymap('n', '<A-h>', function() harpoon:list():prev() end, { desc = 'prev file in harpoon menu' })
    Keymap('n', '<A-l>', function() harpoon:list():next() end, { desc = 'next file in harpoon menu' })
  end,
}
