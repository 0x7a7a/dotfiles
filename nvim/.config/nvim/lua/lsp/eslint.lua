-- https://github.com/hrsh7th/vscode-langservers-extracted
if vim.fn.executable('eslint') == 0 then
  return
end

require('lspconfig').eslint.setup({})
