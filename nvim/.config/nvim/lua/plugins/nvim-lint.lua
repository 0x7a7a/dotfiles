return {
  'mfussenegger/nvim-lint',
  event = 'VeryLazy',
  enabled = false,
  config = function()
    -- Go lint config:
    -- https://gist.github.com/maratori/47a4d00457a92aa426dbd48a18776322
    -- local lint = require('lint')
    -- lint.linters_by_ft = {
    --   go = { 'golangcilint' },
    -- }

    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
