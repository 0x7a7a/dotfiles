local opts = {
  log_level = 'info',
  auto_session_enable_last_session = false,
  auto_session_enabled = true,
  auto_save_enabled = nil,
  auto_restore_enabled = nil,
  auto_session_suppress_dirs = nil,

  pre_save_cmds = { "lua require'nvim-tree.view'.close()", "lua require'symbols-outline.preview'.close()" },
}

require('auto-session').setup(opts)

vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'
