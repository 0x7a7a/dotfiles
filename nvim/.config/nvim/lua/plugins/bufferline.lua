local bufferline = require('bufferline')
bufferline.setup({
  options = {
    mode = 'buffers',
    style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
    themable = true,
    numbers = 'none',
    close_command = 'bdelete! %d', -- can be a string | function, see "Mouse actions"
    right_mouse_command = 'bdelete! %d', -- can be a string | function, see "Mouse actions"
    left_mouse_command = 'buffer %d', -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    indicator = {
      -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'none',
    },

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
})

Keymap('n', '<A-1>', '<CMD>BufferLineGoToBuffer 1<CR>')
Keymap('n', '<A-2>', '<CMD>BufferLineGoToBuffer 2<CR>')
Keymap('n', '<A-3>', '<CMD>BufferLineGoToBuffer 3<CR>')
Keymap('n', '<A-4>', '<CMD>BufferLineGoToBuffer 4<CR>')
Keymap('n', '<A-5>', '<CMD>BufferLineGoToBuffer 5<CR>')
Keymap('n', '<A-6>', '<CMD>BufferLineGoToBuffer 6<CR>')
Keymap('n', '<A-7>', '<CMD>BufferLineGoToBuffer 7<CR>')
Keymap('n', '<A-8>', '<CMD>BufferLineGoToBuffer 8<CR>')
Keymap('n', '<A-9>', '<CMD>BufferLineGoToBuffer 9<CR>')

Keymap('n', '<A-h>', '<CMD>BufferLineCyclePrev<CR>')
Keymap('n', '<A-l>', '<CMD>BufferLineCycleNext<CR>')
Keymap('n', '<leader>bb', '<CMD>BufDel<CR>')
Keymap('n', '<leader>bs', '<CMD>BufferLineSortByDirectory<CR>')
Keymap('n', '<leader>bo', '<CMD>BufDelOthers<CR>')
Keymap('n', '<leader>bp', '<CMD>BufferLinePick<CR>')
