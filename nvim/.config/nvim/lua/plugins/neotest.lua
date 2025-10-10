return {
  'nvim-neotest/neotest',
  event = 'VeryLazy',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',

    'lawrence-laz/neotest-zig',
    {
      'fredrikaverpil/neotest-golang',
      version = '*',
      dependencies = {
        {
          'andythigpen/nvim-coverage',
          opts = {
            auto_reload = true,
            signs = {
              covered = { priority = 100 },
              uncovered = { priority = 100 },
            },
          },
        },
      },
    },
  },
  config = function()
    local neotest_golang_opts = {
      -- runner = 'go',
      runner = 'gotestsum',
      go_test_args = {
        '-v',
        '-race',
        '-count=1',
        '-coverprofile=' .. vim.fn.getcwd() .. '/coverage.out',
      },
    }

    local neotest = require('neotest')
    neotest.setup({
      adapters = {
        require('neotest-zig'),
        -- require('neotest-golang'),
        require('neotest-golang')(neotest_golang_opts),
      },
    })

    -- stylua: ignore start
    vim.keymap.set('n', '<leader>tn', function() require("neotest").run.run() end, { desc = '[t]est [n]earest' })
    vim.keymap.set('n', '<leader>tl', function() require("neotest").run.run_last() end, { desc = '[t]est [l]ast' })
    vim.keymap.set('n', '<leader>tA', function() require("neotest").run.run(vim.uv.cwd()) end, { desc = '[t]est [A]ll files' })
    vim.keymap.set('n', '<leader>tS', function() require("neotest").run.run({ suite = true }) end, { desc = '[t]est [S]uite' })
    vim.keymap.set('n', '<leader>tf', function() require('neotest').run.run(vim.fn.expand('%')) end, { desc = '[t]est run [f]ile' })
    vim.keymap.set('n', '<leader>ts', function() require("neotest").summary.toggle() end, { desc = '[t]est [s]ummary' })
    vim.keymap.set('n', '<leader>to', function() require("neotest").output.open({ enter = true, auto_close = true }) end, { desc = '[t]est [o]utput' })
    vim.keymap.set('n', '<leader>tO', function() require("neotest").output_panel.toggle() end, { desc = '[t]est [O]utput panel' })
    vim.keymap.set('n', '<leader>tt', function() require("neotest").run.stop() end, { desc = '[t]est [t]erminate' })
    -- stylua: ignore end

    -- Coverage
    vim.keymap.set('n', '<leader>cc', '<cmd>Coverage<CR>', { desc = 'Show coverage' })
    vim.keymap.set('n', '<leader>ct', '<cmd>CoverageToggle<CR>', { desc = 'Toggle coverage column sign' })
    vim.keymap.set('n', '<leader>cs', '<cmd>CoverageSummary<CR>', { desc = 'Toggle coverage column sign' })
  end,
}
