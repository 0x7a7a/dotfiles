return {
  'echasnovski/mini.files',
  event = 'VeryLazy',
  dependencies = {
    {
      -- It must be setuped before mini.files
      's1n7ax/nvim-window-picker',
      name = 'window-picker',
      version = '2.*',
      opts = {
        filter_rules = {
          bo = {
            filetype = { 'minifiles', 'fidget' },
            buftype = { 'terminal' },
          },
        },
        selection_chars = 'hjkl;',
      },
    },
  },
  config = function()
    local MiniFiles = require('mini.files')
    MiniFiles.setup()

    local minifiles_toggle = function()
      if not MiniFiles.close() then
        MiniFiles.open(vim.api.nvim_buf_get_name(0))
        MiniFiles.reveal_cwd()
      end
    end

    local show_dotfiles = true

    local filter_show = function()
      return true
    end

    local filter_hide = function(fs_entry)
      return not vim.startswith(fs_entry.name, '.')
    end

    local toggle_dotfiles = function()
      show_dotfiles = not show_dotfiles
      local new_filter = show_dotfiles and filter_show or filter_hide
      MiniFiles.refresh({ content = { filter = new_filter } })
    end

    local map_split = function(buf_id, lhs, direction)
      local rhs = function()
        -- Make new window and set it as target
        local cur_target = MiniFiles.get_explorer_state().target_window
        local new_target = vim.api.nvim_win_call(cur_target, function()
          vim.cmd(direction .. ' split')
          return vim.api.nvim_get_current_win()
        end)

        MiniFiles.set_target_window(new_target)
        MiniFiles.go_in({ close_on_file = true })
      end

      -- Adding `desc` will result into `show_help` entries
      local desc = 'Split ' .. direction
      vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
    end

    vim.keymap.set('n', '<Space>f', minifiles_toggle)
    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local buf_id = args.data.buf_id
        -- Tweak left-hand side of mapping to your liking
        vim.keymap.set('n', 'g.', toggle_dotfiles, { buffer = buf_id, desc = 'toggle dotfiles' })
        map_split(buf_id, '<C-s>', 'belowright horizontal')
        map_split(buf_id, '<C-v>', 'belowright vertical')

        -- Window Pick
        local open_in_window_picker = function()
          local fs_entry = MiniFiles.get_fs_entry()
          if fs_entry ~= nil and fs_entry.fs_type == 'file' then
            local picked_window_id = require('window-picker').pick_window()
            if picked_window_id == nil then
              return
            end
            MiniFiles.set_target_window(picked_window_id)
          end
          MiniFiles.go_in({
            close_on_file = true,
          })
        end
        vim.keymap.set('n', 'l', open_in_window_picker, { buffer = buf_id, desc = 'Open in target window' })
      end,
    })
  end,
}
