return {
  'LintaoAmons/bookmarks.nvim',
  tag = 'v4.0.0',
  dependencies = {
    { 'kkharji/sqlite.lua' },
    { 'folke/snacks.nvim' },
  },
  enabled = false,
  config = function()
    local opts = {}
    require('bookmarks').setup(opts)
  end,
}
