local AUGROUP = vim.api.nvim_create_augroup('_AUGROUP', {})

-- Autocommand to update cursorline and relative line numbers based on insert mode
vim.api.nvim_create_autocmd({ 'InsertEnter', 'InsertLeave' }, {
  callback = function(arg)
    local in_insert = arg.event == 'InsertEnter'
    vim.wo.cursorlineopt = in_insert and 'number' or 'both'
    vim.wo.relativenumber = not in_insert
  end,
  group = AUGROUP,
})

local function set_custom_highlights()
  vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = 'orange' })
  vim.api.nvim_set_hl(0, 'WindowPickerStatusLine', { fg = '#ededed', bg = '#44cc41', bold = true })
  vim.api.nvim_set_hl(0, 'WindowPickerStatusLineNC', { fg = '#ededed', bg = '#44cc41', bold = true })

  if vim.g.colors_name == 'rose-pine' and vim.o.background == 'light' then
    -- Make the cursor easier to distinguish from illuminate highlights.
    vim.api.nvim_set_hl(0, 'Cursor', { fg = '#000000', bg = '#EAA041' })
  else
    vim.api.nvim_set_hl(0, 'Cursor', {})
  end
end

vim.api.nvim_create_autocmd('ColorScheme', {
  callback = set_custom_highlights,
  group = AUGROUP,
})
