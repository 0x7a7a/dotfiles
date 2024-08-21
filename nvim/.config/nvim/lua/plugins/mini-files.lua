return {
  'echasnovski/mini.files',
  dependencies = {
    {
      's1n7ax/nvim-window-picker',
      name = 'window-picker',
      event = 'VeryLazy',
      version = '2.*',
      opts = {},
    },
  },
  keys = {
    { '<Space>f', '<Cmd>lua require("mini.files").open()<CR>', desc = 'Open MiniFiles' },
  },
  config = function()
    local minifiles = require('mini.files')
    minifiles.setup({
      mappings = {
        go_in = 'L',
        go_in_plus = 'l',
      },
    })

    local minifiles_toggle = function(...)
      if not minifiles.close() then
        minifiles.open(...)
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
      minifiles.refresh({ content = { filter = new_filter } })
    end

    local split_open = function(buf_id, lhs, direction)
      local rhs = function()
        -- Make new window and set it as target
        local new_target_window
        vim.api.nvim_win_call(minifiles.get_target_window(), function()
          vim.cmd(direction .. ' split')
          new_target_window = vim.api.nvim_get_current_win()
        end)

        minifiles.set_target_window(new_target_window)
        minifiles.go_in()
        minifiles.close()
      end

      -- Adding `desc` will result into `show_help` entries
      local desc = 'Split ' .. direction
      vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
    end

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local buf_id = args.data.buf_id
        -- Tweak left-hand side of mapping to your liking
        vim.keymap.set('n', 'g.', toggle_dotfiles, { buffer = buf_id })
        vim.keymap.set('n', '<Space>f', minifiles_toggle, { buffer = buf_id })
        split_open(buf_id, 'gs', 'belowright horizontal')
        split_open(buf_id, 'gv', 'belowright vertical')

        -- Window Pick
        local open_in_window_picker = function()
          local fs_entry = minifiles.get_fs_entry()
          if fs_entry ~= nil and fs_entry.fs_type == 'file' then
            local picked_window_id = require('window-picker').pick_window()
            minifiles.set_target_window(picked_window_id)
          end
          minifiles.go_in({
            close_on_file = true,
          })
        end
        vim.keymap.set('n', 'l', open_in_window_picker, { buffer = buf_id, desc = 'Open in target window' })
      end,
    })
  end,
}
