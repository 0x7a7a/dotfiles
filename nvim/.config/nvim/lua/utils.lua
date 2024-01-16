local M = {}

M.npm_read_json_file = function(filename)
  local Path = require('plenary.path')
  local path = Path:new(filename)
  if not path:exists() then
    return nil
  end

  local json_contents = path:read()
  local json = vim.fn.json_decode(json_contents)

  return json
end

M.npm_is_package_installed = function(package)
  local package_json = M.npm_read_json_file('package.json')
  if not package_json then
    return false
  end

  if package_json.dependencies and package_json.dependencies[package] then
    return true
  end

  if package_json.devDependencies and package_json.devDependencies[package] then
    return true
  end

  return false
end

return M
