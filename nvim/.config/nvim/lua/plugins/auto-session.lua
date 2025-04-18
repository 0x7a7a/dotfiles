return {
  'rmagatti/auto-session',
  config = function()
    vim.o.sessionoptions = 'buffers,curdir,folds,help,tabpages,winsize,winpos'

    local function clean_buffers()
      local bufs = vim.api.nvim_list_bufs()
      for _, buf in ipairs(bufs) do
        local name = vim.api.nvim_buf_get_name(buf)
        local type = vim.api.nvim_get_option_value('buftype', { buf = buf })
        if name ~= '' and type ~= '' and type ~= 'terminal' then
          vim.api.nvim_buf_delete(buf, {})
        end
      end
    end

    require('auto-session').setup({
      auto_session_enable_last_session = false,
      auto_session_root_dir = vim.fn.stdpath('data') .. '/sessions/',
      auto_session_suppress_dirs = { '~/', '/' },
      auto_session_use_git_branch = nil,
      purge_after_minutes = 14400,
      pre_save_cmds = { clean_buffers },
    })
  end,
}
