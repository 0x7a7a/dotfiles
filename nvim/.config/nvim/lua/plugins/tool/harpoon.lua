return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  requires = { { 'nvim-lua/plenary.nvim' } },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup()

    Keymap('n', '<A-1>', function()
      harpoon:list():select(1)
    end)
    Keymap('n', '<A-2>', function()
      harpoon:list():select(2)
    end)
    Keymap('n', '<A-3>', function()
      harpoon:list():select(3)
    end)
    Keymap('n', '<A-4>', function()
      harpoon:list():select(4)
    end)

    Keymap('n', '<Space>hm', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'toggle harpoon menu' })
    Keymap('n', '<Space>ha', function()
      harpoon:list():append()
    end, { desc = 'add the file to harpoon menu' })
    Keymap('n', '<Space>hd', function()
      harpoon:list():remove()
    end, { desc = 'remove file in harpoon menu' })
    Keymap('n', '<Space>hc', function()
      harpoon:clear()
    end, { desc = 'clear harpoon menu' })
    Keymap('n', '<A-]>', function()
      harpoon:list():prev()
    end, { desc = 'prev file in harpoon menu' })
    Keymap('n', '<A-[>', function()
      harpoon:list():next()
    end, { desc = 'next file in harpoon menu' })
  end,
}