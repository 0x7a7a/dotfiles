return {
  'hiphish/rainbow-delimiters.nvim',
  event = 'BufEnter',
  enabled = false,
  init = function()
    vim.g.rainbow_delimiters = {
      blacklist = { 'zig' },
    }
  end,
}
