require('bufferline').setup {
  options = {
    mode = 'buffers',
    numbers = 'none',
    close_command = 'bdelete! %d', -- can be a string | function, see "Mouse actions"
    right_mouse_command = 'bdelete! %d', -- can be a string | function, see "Mouse actions"
    left_mouse_command = 'buffer %d', -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"

    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator = { style = 'icon' },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',

    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_buffer_icons = true,
    show_tab_indicators = true,
    diagnostics = 'nvim_lsp',
    diagnostics_update_in_insert = false,
    always_show_bufferline = true,
    -- "slant" | "thick" | "thin" | { 'any', 'any' },
    separator_style = 'thin',
    offsets = {
      {
        filetype = 'NvimTree',
        text = function()
          return vim.fn.getcwd()
        end,
        highlight = 'Directory',
        text_align = 'left',
      },
    },
    diagnostics_indicator = function()
      return ' '
    end,
    color_icons = true,
  },
}

Keymap('n', '<A-h>', ':BufferLineCyclePrev<CR>')
Keymap('n', '<A-l>', ':BufferLineCycleNext<CR>')
