-- https://github.com/rebelot/heirline.nvim
return {
  'nvim-lualine/lualine.nvim',
  event = 'BufEnter',
  config = function()
    require('lualine').setup({
      options = {
        globalstatus = true,
        icons_enabled = true,
        theme = 'auto',
        component_separators = '',
        section_separators = {
          left = '',
          right = '',
        },
      },
      sections = {
        lualine_a = { { 'mode', icon = ' ' } },
        lualine_b = {
          { 'branch', icon = ' ' },
          {
            'filename',
            file_status = true,
            -- 0: Just the filename
            -- 1: Relative path
            -- 2: Absolute path
            path = 1,
            shorting_target = 40,
            symbols = {
              modified = '[+]',
              readonly = '[-]',
              newfile = '[New]',
              unnamed = '[No Name]',
            },
          },
          {
            'diff',
          },
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = {
              error = ' ',
              warn = ' ',
              info = ' ',
              hint = ' ',
            },
          },
        },
        lualine_c = {
          { 'aerial' },
        },

        lualine_x = {
          {
            require('lazy.status').updates,
            cond = require('lazy.status').has_updates,
            color = { fg = '#ff9e64' },
          },
        },
        lualine_y = {
          'filetype',
          'encoding',
        },
        lualine_z = { 'progress', 'location' },
      },
      extensions = { 'quickfix', 'toggleterm', 'fugitive' },
    })
  end,
}
