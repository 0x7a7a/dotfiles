local AUGROUP = vim.api.nvim_create_augroup('Z', {})

function Z.autocmd(event, pattern, cmds)
  if cmds == nil then
    cmds = pattern
    pattern = nil
  end

  local callback = type(cmds) == 'function' and cmds
    or function()
      for opt, val in pairs(cmds) do
        vim.opt_local[opt] = val
      end
    end

  vim.api.nvim_create_autocmd(event, {
    callback = callback,
    group = AUGROUP,
    pattern = pattern,
  })
end

function Z.has(mod)
  local exists, _ = pcall(require, mod)
  return exists
end

function Z.toggle_quickfix()
  local qf_windows = vim.tbl_filter(function(winid)
    return vim.fn.getwininfo(winid)[1].quickfix == 1
  end, vim.api.nvim_tabpage_list_wins(0))

  local cmd = #qf_windows == 0 and 'copen' or 'cclose'
  vim.cmd(cmd)
end

function Z.update_plugins()
  vim.cmd(':TSUpdate')
  require('lazy').sync()
end

-- User command
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
