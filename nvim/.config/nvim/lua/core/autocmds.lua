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
      if vim.bo.filetype == 'help' then
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

local function close_aerial_before_quit()
  vim.api.nvim_create_autocmd('QuitPre', {
    group = common_group,
    pattern = '*',
    callback = function()
      if not package.loaded['aerial'] then
        require('aerial').close_all()
      end
    end,
  })
end

smart_number()
hightlight_yank()
close_aerial_before_quit()
