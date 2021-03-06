local config_group = vim.api.nvim_create_augroup('Config', {})
vim.api.nvim_create_autocmd('FileType', {
  group = config_group,
  pattern = { 'javascript' },
  callback = function()
    vim.opt.shiftwidth = 2
  end,
})

vim.api.nvim_create_autocmd({ 'InsertEnter', 'InsertLeave' }, {
  group = config_group,
  pattern = '*',
  desc = 'smart cursorline',
  callback = function(arg)
    vim.opt.cursorline = arg.event == 'InsertLeave'
  end,
})
