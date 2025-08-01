local AUGROUP = vim.api.nvim_create_augroup('_AUGROUP', {})

-- Autocommand to set the cursorlineopt based on insert mode
vim.api.nvim_create_autocmd({ 'InsertEnter', 'InsertLeave' }, {
  callback = function(arg)
    if arg.event == 'InsertEnter' then
      vim.opt.cursorlineopt = 'number'
    else
      vim.opt.cursorlineopt = 'both'
    end
  end,
  group = AUGROUP,
})

-- Autocommand to toggle relative numbers based on insert mode
vim.api.nvim_create_autocmd({ 'InsertEnter', 'InsertLeave' }, {
  callback = function(arg)
    local filetypes = { 'help', 'copilot-chat', 'qf', 'codecompanion' }
    local ft = vim.bo.filetype
    if vim.tbl_contains(filetypes, ft) then
      vim.opt.relativenumber = false
      return
    end

    vim.opt.relativenumber = arg.event == 'InsertLeave'
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
