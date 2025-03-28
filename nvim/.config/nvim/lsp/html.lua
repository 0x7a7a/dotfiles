-- https://github.com/hrsh7th/vscode-langservers-extracted
return {
  cmd = { 'vscode-html-language-server', '--stdio' },
  root_markers = { 'package.json', '.git' },
  filetypes = { 'html', 'templ', 'vue' },
  init_options = {
    provideFormatter = true,
    embeddedLanguages = { css = true, javascript = true },
    configurationSection = { 'html', 'css', 'javascript' },
  },
}
