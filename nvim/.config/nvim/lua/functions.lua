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

function Z.close_other_bufs()
  if vim.fn.exists(':FloatermKill') > 0 then
    vim.cmd('FloatermKill')
  end
  vim.cmd('%bd|e#|bd#')
end

function Z.toggle_quickfix()
  local qf_windows = vim.tbl_filter(function(winid)
    return vim.fn.getwininfo(winid)[1].quickfix == 1
  end, vim.api.nvim_tabpage_list_wins(0))

  local cmd = #qf_windows == 0 and 'copen' or 'cclose'
  vim.cmd(cmd)
end

function Z.is_npm_project()
  local paths = vim.fs.find('package.json', { upward = true })
  return #paths > 0
end

function Z.npm_installed(package)
  local paths = vim.fs.find('package.json', { upward = true })
  if #paths == 0 then
    return false
  end

  local package_file = paths[1]
  local package_json = vim.fn.json_decode(vim.fn.readfile(package_file))

  if package_json.dependencies and package_json.dependencies[package] then
    return true
  end
  if package_json.devDependencies and package_json.devDependencies[package] then
    return true
  end

  return false
end
