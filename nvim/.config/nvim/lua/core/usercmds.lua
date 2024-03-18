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

  if package.loaded[name] then
    package.loaded[name] = nil

    local new_module = require(name)
    if type(new_module['setup']) == 'function' then
      new_module.setup({})
    end
  end
end, { nargs = 1 })
