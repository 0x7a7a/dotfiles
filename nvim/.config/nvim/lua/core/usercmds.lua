local usercmd = vim.api.nvim_create_user_command

usercmd('CopyRelPath', function()
  local path = vim.fn.expand('%')
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

usercmd('CopyPath', function()
  local path = vim.fn.expand('%:p')
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

-- fast hot reloading while developing plugins
usercmd('R', function(cmd)
  local name = cmd.args
  require('lazy.core.loader').reload(name)
end, { nargs = 1 })
