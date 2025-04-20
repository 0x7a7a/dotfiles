-- https://github.com/golang/tools/tree/master/gopls
return {
  cmd = { 'gopls' },
  root_markers = { 'go.mod', 'go.work', '.git' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  flags = { allow_incremental_sync = true, debounce_text_changes = 1000 },
  settings = {
    hints = {
      constantValues = true,
      functionTypeParameters = true,
    },
    gopls = {
      staticcheck = true,
    },
  },
}
