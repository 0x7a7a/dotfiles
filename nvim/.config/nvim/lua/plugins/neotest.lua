return {
  'nvim-neotest/neotest',
  event = 'VeryLazy',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',

    'nvim-neotest/neotest-go',
    'lawrence-laz/neotest-zig',
  },
  config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-go'),
        require('neotest-zig'),
      },
    })

    vim.keymap.set('n', '<leader>r', '<cmd>Neotest run<CR>', { desc = 'Run tests' })
    -- vim.keymap.set('n', '<leader>to', '<cmd>Neotest output<CR>', { desc = 'Run tests' })
    -- vim.keymap.set('n', '<leader>tp', '<cmd>Neotest output-panel<CR>', { desc = 'Run tests' })
  end,
}
