return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  requires = { { 'nvim-lua/plenary.nvim' } },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup()

    Keymap('n', '<Space>hm', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
    Keymap('n', '<Space>ha', function()
      harpoon:list():append()
    end)
    Keymap('n', '<Space>hd', function()
      harpoon:list():remove()
    end)
    Keymap('n', '<Space>hc', function()
      harpoon:clear()
    end)
    Keymap('n', '<A-]>', function()
      harpoon:list():prev()
    end)
    Keymap('n', '<A-[>', function()
      harpoon:list():next()
    end)
  end,
}
