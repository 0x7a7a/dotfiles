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

    vim.keymap.set('n', '<leader>rr', '<cmd>Neotest run<CR>', { desc = 'Run test function' })
    vim.keymap.set('n', '<leader>rf', '<cmd>Neotest run file<CR>', { desc = 'Run test file' })
    -- vim.keymap.set('n', '<leader>to', '<cmd>Neotest output<CR>', { desc = 'Run tests' })
    -- vim.keymap.set('n', '<leader>tp', '<cmd>Neotest output-panel<CR>', { desc = 'Run tests' })
  end,
}
