if not vim.fn.executable('tailwindcss-language-server') then
  return
end

require('lspconfig').tailwindcss.setup({})
