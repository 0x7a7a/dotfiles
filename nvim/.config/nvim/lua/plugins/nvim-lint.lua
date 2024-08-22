return {
  'mfussenegger/nvim-lint',
  event = 'VeryLazy',
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      go = { 'golangcilint' },
    }

    vim.keymap.set('n', '<leader>lt', function()
      lint.try_lint()
    end, { desc = 'Trigger linting for current file' })
  end,
}
