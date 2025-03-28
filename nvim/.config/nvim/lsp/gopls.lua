-- https://github.com/golang/tools/tree/master/gopls
return {
  cmd = { 'gopls' },
  root_markers = { 'go.mod', 'go.work', '.git' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  flags = { allow_incremental_sync = true, debounce_text_changes = 1000 },
  settings = {
    gopls = {
      analyses = { unusedparams = true, unreachable = false },
      usePlaceholders = false,
      staticcheck = true,
      diagnosticsDelay = '500ms',
    },
  },
}
