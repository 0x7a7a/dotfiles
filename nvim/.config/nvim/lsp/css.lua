-- https://github.com/hrsh7th/vscode-langservers-extracted
return {
  cmd = { 'vscode-css-language-server', '--stdio' },
  root_markers = { 'package.json', '.git' },
  filetypes = { 'css', 'scss', 'less' },
  init_options = { provideFormatter = true },
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
}
