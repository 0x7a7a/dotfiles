local themes = require('telescope.themes')
local M = {}

M.fd_in_zsh = function()
  local cfg_path = vim.fn.expand('~/zsh')
  if not vim.loop.fs_stat(cfg_path) then
    vim.api.nvim_err_writeln(string.format('no zsh config path: %s', cfg_path))
    return
  end
  local opts = vim.deepcopy(themes.get_dropdown({
    hidden = true,
    winblend = 10,
    width = 0.5,
    prompt = ' ',
    results_height = 15,
    previewer = false,
    prompt_prefix = 'Zsh> ',
    cwd = vim.fn.expand('~/zsh'),
  }))

  require('telescope.builtin').fd(opts)
end

M.fd_in_nvim = function()
  local opts = vim.deepcopy(themes.get_dropdown({
    hidden = true,
    follow = true,
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

-- for test
local opt = themes.get_cursor({})
function fd()
  local opts = vim.deepcopy(opt)
  opts.prompt_prefix = 'Code Action>'
  require('telescope.builtin').fd(opts)
end

return M
