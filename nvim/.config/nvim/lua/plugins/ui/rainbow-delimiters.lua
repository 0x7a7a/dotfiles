return {
  'hiphish/rainbow-delimiters.nvim',
  event = 'BufEnter',
  init = function()
    vim.g.rainbow_delimiters = {
      blacklist = { 'zig' },
    }
  end,
}
