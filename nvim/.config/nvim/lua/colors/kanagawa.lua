require('kanagawa').setup({
  undercurl = true, -- enable undercurls
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  transparent = true, -- do not set background color
  dimInactive = false, -- dim inactive window `:h hl-NormalNC`
  terminalColors = true, -- define vim.g.terminal_color_{0,17}
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = 'none',
        },
      },
    },
  },
  theme = 'wave',
  background = {
    dark = 'wave',
    light = 'lotus',
  },
})
