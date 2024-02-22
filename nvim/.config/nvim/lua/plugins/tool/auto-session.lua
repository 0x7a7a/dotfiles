return {
  'rmagatti/auto-session',
  config = function()
    local opts = {
      log_level = vim.log.levels.ERROR,
      auto_session_root_dir = vim.fn.stdpath('config') .. '/misc/sessions/',
      auto_session_enable_last_session = false,
      auto_session_enabled = true,
      auto_save_enabled = nil,
      auto_restore_enabled = nil,
      auto_session_suppress_dirs = nil,
    }
    vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'

    require('auto-session').setup(opts)
  end,
}
