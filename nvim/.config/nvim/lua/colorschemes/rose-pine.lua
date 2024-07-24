return {
  'rose-pine/neovim',
  lazy = true,
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
