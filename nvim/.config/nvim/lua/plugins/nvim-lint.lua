return {
  'mfussenegger/nvim-lint',
  event = 'VeryLazy',
  config = function()
    local lint = require('lint')
    local golint = lint.linters.golangcilint
    table.insert(golint.args, '--disable=errcheck')

    lint.linters_by_ft = {
      go = { 'golangcilint' },
    }

    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
