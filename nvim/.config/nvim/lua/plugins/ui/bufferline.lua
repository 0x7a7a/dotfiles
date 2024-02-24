return {
  'akinsho/bufferline.nvim',
  config = function()
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

    -- Keymap('n', '<A-1>', '<cmd>BufferLineGoToBuffer 1<cr>')
    -- Keymap('n', '<A-2>', '<cmd>BufferLineGoToBuffer 2<cr>')
    -- Keymap('n', '<A-3>', '<cmd>BufferLineGoToBuffer 3<cr>')
    -- Keymap('n', '<A-4>', '<cmd>BufferLineGoToBuffer 4<cr>')
    -- Keymap('n', '<A-5>', '<cmd>BufferLineGoToBuffer 5<cr>')
    -- Keymap('n', '<A-6>', '<cmd>BufferLineGoToBuffer 6<cr>')
    -- Keymap('n', '<A-7>', '<cmd>BufferLineGoToBuffer 7<cr>')
    -- Keymap('n', '<A-8>', '<cmd>BufferLineGoToBuffer 8<cr>')
    -- Keymap('n', '<A-9>', '<cmd>BufferLineGoToBuffer 9<cr>')

    Keymap('n', '<A-h>', '<cmd>BufferLineCyclePrev<cr>')
    Keymap('n', '<A-l>', '<cmd>BufferLineCycleNext<cr>')
    Keymap('n', '<leader>bb', '<cmd>bd<cr>')
    Keymap('n', '<leader>bc', '<cmd>BufferLinePickClose<cr>')
    Keymap('n', '<leader>bs', '<cmd>BufferLineSortByDirectory<cr>')
    Keymap('n', '<leader>bo', '<cmd>BufferLineCloseOthers<cr>')
    Keymap('n', '<leader>bp', '<cmd>BufferLinePick<cr>')
  end,
}
