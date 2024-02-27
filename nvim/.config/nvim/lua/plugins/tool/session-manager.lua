return {
  'Shatur/neovim-session-manager',
  config = function()
    local Path = require('plenary.path')
    local config = require('session_manager.config')
    require('session_manager').setup({
      sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
      autoload_mode = config.AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
      autosave_last_session = true, -- Automatically save last session on exit and on session switch.
      autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
      autosave_ignore_dirs = {}, -- A list of directories where the session will not be autosaved.
      autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
        'gitcommit',
        'gitrebase',
      },
      autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
      autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
      max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
    })
  end,
}

-- return {
--   'rmagatti/auto-session',
--   config = function()
--     local opts = {
--       log_level = vim.log.levels.ERROR,
--       auto_session_root_dir = vim.fn.stdpath('config') .. '/misc/sessions/',
--       auto_session_enable_last_session = false,
--       auto_session_enabled = true,
--       auto_save_enabled = nil,
--       auto_restore_enabled = nil,
--       auto_session_suppress_dirs = nil,
--     }
--     vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'
--
--     require('auto-session').setup(opts)
--   end,
-- }
