-- https://github.com/vuejs/language-tools/wiki/Neovim
local vue_language_server_path = vim.fn.expand('$MASON/packages')
  .. '/vue-language-server'
  .. '/node_modules/@vue/language-server'

local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}

-- https://github.com/yioneko/vtsls
return {
  cmd = { 'vtsls', '--stdio' },
  root_markers = { 'tsconfig.json', 'package.json', 'jsconfig.json', '.git' },

  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },

  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'vue',
  },
}
