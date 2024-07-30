return {
  'rose-pine/neovim',
  enalbed = false,
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
