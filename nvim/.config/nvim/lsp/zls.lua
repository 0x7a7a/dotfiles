-- https://github.com/zigtools/zls
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/zls.lua
return {
  cmd = { 'zls' },
  filetypes = { 'zig', 'zir' },
  root_markers = { 'zls.json', 'build.zig', '.git' },
}
