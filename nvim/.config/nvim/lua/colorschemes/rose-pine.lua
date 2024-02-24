return {
  'rose-pine/neovim',
  lazy = true,
  config = function()
    require('rose-pine').setup({
      styles = {
        transparency = true,
      },
    })
  end,
}
