return {
  'rmagatti/auto-session',
  config = function()
    vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'

    local function close_bufpin()
      if Z.has('bufpin') then
        require('bufpin').close()
      end
    end

    local opts = {
      log_level = 'error',
      auto_session_enable_last_session = false,
      auto_session_root_dir = vim.fn.stdpath('data') .. '/sessions/',
      auto_session_enabled = true,
      auto_save_enabled = nil,
      auto_restore_enabled = nil,
      auto_session_suppress_dirs = { '~/', '/' },

      auto_session_use_git_branch = nil,
      -- the configs below are lua only
      bypass_session_save_file_types = nil,

      -- ⚠️ This will only work if Telescope.nvim is installed
      -- The following are already the default values, no need to provide them if these are already the settings you want.
      session_lens = {
        -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
        buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
        load_on_setup = false,
        theme_conf = { border = true },
        previewer = false,
      },

      pre_save_cmds = { close_bufpin },
    }

    require('auto-session').setup(opts)
  end,
}
