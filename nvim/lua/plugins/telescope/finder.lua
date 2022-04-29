local themes = require('telescope.themes')
local finders = {}

-- local center_list = themes.get_dropdown({
--   winblend = 10,
--   width = 0.5,
--   prompt = ' ',
--   results_height = 15,
--   previewer = false,
-- })

finders.fd_in_nvim = function()
  local opts = vim.deepcopy(themes.get_dropdown({
    winblend = 10,
    width = 0.5,
    prompt = ' ',
    results_height = 15,
    previewer = false,
    prompt_prefix = 'Nvim> ',
    cwd = vim.fn.stdpath('config'),
  }))

  require('telescope.builtin').fd(opts)
end

-- telescope test
local opt = themes.get_cursor({})
function fd()
  local opts = vim.deepcopy(opt)
  opts.prompt_prefix = 'Code Action>'
  require('telescope.builtin').fd(opts)
end

return finders
