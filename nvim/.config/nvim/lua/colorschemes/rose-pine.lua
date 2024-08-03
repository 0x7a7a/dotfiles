return {
  'rose-pine/neovim',
  config = function()
    require('rose-pine').setup({
      styles = {
        bold = false,
        italic = false,
        transparency = true,
      },
    })
  end,
}
