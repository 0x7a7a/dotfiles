-- https://github.com/rmagatti/auto-session/issues/64
local close_all_floating_wins = function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= '' then
      vim.api.nvim_win_close(win, false)
    end
  end
end

local opts = {
  log_level = 'info',
  auto_session_enable_last_session = false,
  auto_session_enabled = true,
  auto_save_enabled = nil,
  auto_restore_enabled = nil,
  auto_session_suppress_dirs = nil,

  pre_save_cmds = {
    "lua require'nvim-tree.view'.close()",
    "lua require'symbols-outline.preview'.close()",
    close_all_floating_wins,
  },
}

require('auto-session').setup(opts)

vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'
