return {
  'nvim-neotest/neotest',
  enabled = false,
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',

    'nvim-neotest/neotest-go',
    'marilari88/neotest-vitest',
  },
  event = 'VeryLazy',
  config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-go'),
        require('neotest-vitest'),
      },
    })
  end,
  -- stylua: ignore
  keys = {
    { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
    { "<leader>tn", function() require("neotest").run.run() end, desc = "Run Nearest" },
    { "<leader>tT", function() require("neotest").run.run(vim.loop.cwd()) end, desc = "Run All Test Files" },
    { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run Last" },
    { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
    { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
    { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
    { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop" },
    { "<leader>tw", function() require("neotest").watch.toggle() end, desc = "Neotest watch nearest" },
    { "<leader>tW", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Neotest watch file" },
  },
}
