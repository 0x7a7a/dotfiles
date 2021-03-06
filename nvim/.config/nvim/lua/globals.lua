local ok, plenary_reload = pcall(require, 'plenary.reload')
local reloader
if not ok then
  reloader = require
else
  reloader = plenary_reload.reload_module
end

RELOAD = function(...)
  return reloader(...)
end

R = function(name)
  RELOAD(name)

  vim.notify 'Relod Success!'
end

P = function(v)
  print(vim.inspect(v))
  return v
end
