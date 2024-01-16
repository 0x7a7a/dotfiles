local function highlight_cursorline()
  vim.opt.cursorline = true
  vim.api.nvim_create_autocmd({ 'InsertEnter', 'InsertLeave' }, {
    pattern = '*',
    desc = 'smart cursorline',
    callback = function(arg)
      vim.opt.cursorline = arg.event == 'InsertLeave'
    end,
  })
end

local function smart_number()
  vim.api.nvim_create_autocmd({ 'InsertEnter', 'InsertLeave' }, {
    pattern = '*',
    desc = 'smart number',
    callback = function(arg)
      vim.opt.relativenumber = arg.event == 'InsertLeave'
    end,
  })
end

local function hightlight_yank()
  local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
  vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
  })
end

smart_number()
hightlight_yank()
