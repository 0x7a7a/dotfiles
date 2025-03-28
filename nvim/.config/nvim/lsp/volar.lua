-- https://github.com/vuejs/language-tools/tree/master/packages/language-server
local function get_typescript_server_path()
  local project_root = vim.fs.dirname(vim.fs.find('node_modules', { upward = true })[1])
  return project_root and (project_root .. '/node_modules/typescript/lib') or ''
end

local volar_init_options = {
  typescript = {
    tsdk = get_typescript_server_path(),
  },
}

return {
  cmd = { 'vue-language-server', '--stdio' },
  filetypes = { 'vue' },
  root_markers = { 'package.json', '.git' },
  init_options = volar_init_options,
}
