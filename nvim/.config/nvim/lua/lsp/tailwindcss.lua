if vim.fn.executable('tailwindcss-language-server') == 0 then
  return
end

require('lspconfig').tailwindcss.setup({})
