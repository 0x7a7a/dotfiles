return {
  'nvim-neotest/neotest',
  event = 'VeryLazy',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',

    'fredrikaverpil/neotest-golang',
    'lawrence-laz/neotest-zig',
  },
  config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-golang'),
        require('neotest-zig'),
      },
    })

    vim.keymap.set('n', '<leader>tt', '<cmd>Neotest run<CR>', { desc = 'Run test function' })
    vim.keymap.set('n', '<leader>tf', '<cmd>Neotest run file<CR>', { desc = 'Run test file' })
    vim.keymap.set('n', '<leader>to', '<cmd>Neotest output<CR>', { desc = 'Display test output' })
    vim.keymap.set('n', '<leader>ts', '<cmd>Neotest summary toggle<CR>', { desc = 'Toggle neotest summber' })
    -- vim.keymap.set('n', '<leader>to', '<cmd>Neotest output<CR>', { desc = 'Run tests' })
    -- vim.keymap.set('n', '<leader>tp', '<cmd>Neotest output-panel<CR>', { desc = 'Run tests' })
  end,
}
