require('nvim-gps').setup()
local gps = require 'nvim-gps'
require('lualine').setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = 'auto',
    disabled_filetypes = {},
    component_separators = '|',
    section_separators = {
      left = '',
      right = '',
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      { 'branch' },
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
          unnamed = '[No Name]',
        },
      },
      { 'diff' },
    },
    lualine_c = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = {
          error = ' ',
          warn = ' ',
          info = ' ',
        },
      },
      { gps.get_location, cond = gps.is_available },
    },

    lualine_x = {
      -- { require("auto-session-library").current_session_name },
    },
    lualine_y = {
      'filetype',
      'encoding',
      {
        'fileformat',
        symbols = {
          unix = '', -- e712
          dos = '', -- e70f
          mac = '', -- e711
        },
      },
    },
    lualine_z = { 'progress', 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  -- extensions = {"quickfix", "nvim-tree", "toggleterm", "fugitive", symbols_outline}
  extensions = { 'nvim-tree', 'toggleterm', 'fugitive' },
}
