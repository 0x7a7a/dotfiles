local AUGROUP = vim.api.nvim_create_augroup('_AUGROUP', {})

-- Autocommand to update cursorline and relative line numbers based on insert mode
vim.api.nvim_create_autocmd({ 'InsertEnter', 'InsertLeave' }, {
  callback = function(arg)
    local in_insert = arg.event == 'InsertEnter'
    vim.opt.cursorlineopt = in_insert and 'number' or 'both'
    vim.opt.relativenumber = not in_insert
  end,
  group = AUGROUP,
})

-- Autocommand to set the color of CursorLineNr
vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter' }, {
  callback = function()
    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = 'orange' })
  end,
  group = AUGROUP,
})
