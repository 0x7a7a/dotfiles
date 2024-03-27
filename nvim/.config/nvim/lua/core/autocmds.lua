local common_group = vim.api.nvim_create_augroup('CommonGroup', {})
local function highlight_cursorline()
  vim.opt.cursorline = true
  vim.api.nvim_create_autocmd({ 'InsertEnter', 'InsertLeave' }, {
    pattern = '*',
    group = common_group,
    desc = 'smart cursorline',
    callback = function(arg)
      vim.opt.cursorline = arg.event == 'InsertLeave'
    end,
  })
end

local function smart_number()
  vim.api.nvim_create_autocmd({ 'InsertEnter', 'InsertLeave' }, {
    pattern = '*',
    group = common_group,
    desc = 'smart number',
    callback = function(arg)
      local ft = vim.bo.filetype
      if ft == 'help' or ft == 'alpha' then
        return
      end

      if vim.bo.filetype == 'qf' then
        vim.opt.relativenumber = false
        return
      end

      vim.opt.relativenumber = arg.event == 'InsertLeave'
    end,
  })
end

local function hightlight_yank()
  vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      vim.highlight.on_yank()
    end,
    group = common_group,
    pattern = '*',
  })
end

smart_number()
hightlight_yank()
