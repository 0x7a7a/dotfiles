return {
  'otavioschwanck/arrow.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  evet = 'VeryLazy',
  config = function()
    require('arrow').setup({
      show_icons = true,
      leader_key = '<C-e>',
      -- index_keys = "123456789zxcbnmZXVBNM,afghjklAFGHJKLwrtyuiopWRTYUIOP",
      index_keys = 'hjkl;',
    })

    local arrow = require('arrow.persist')
    Keymap('n', '[a', arrow.previous, { desc = 'Arrow: previous arrow list file' })
    Keymap('n', ']a', arrow.next, { desc = 'Arrow: next arrow list file' })
    -- stylua: ignore start
    Keymap('n', '<A-1>', function() arrow.go_to(1) end)
    Keymap('n', '<A-2>', function() arrow.go_to(2) end)
    Keymap('n', '<A-3>', function() arrow.go_to(3) end)
    Keymap('n', '<A-4>', function() arrow.go_to(4) end)
    -- stylua: ignore end
  end,
}
