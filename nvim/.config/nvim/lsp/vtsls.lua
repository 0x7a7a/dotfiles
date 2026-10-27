-- https://github.com/vuejs/language-tools/wiki/Neovim
-- 不依赖 $MASON：mason 是 VeryLazy 加载，直接打开 .vue 文件时该变量可能尚未设置
local mason_root = vim.env.MASON or (vim.fn.stdpath('data') .. '/mason')
local vue_language_server_path = mason_root
  .. '/packages/vue-language-server'
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
