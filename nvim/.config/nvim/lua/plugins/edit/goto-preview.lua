return {
  'rmagatti/goto-preview',
  enabled = false,
  keys = {
    { 'gpd', "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", desc = 'goto_preview_definition' },
    {
      'gpt',
      "<cmd>lua require('goto-preview').goto_preview_type_definition()<cr>",
      desc = 'goto_preview_type_definition',
    },
    {
      'gpi',
      "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>",
      desc = 'goto_preview_implementation',
    },
    { 'gP', "<cmd>lua require('goto-preview').close_all_win()<cr>", desc = 'close_all_win' },
    { 'gpr', "<cmd>lua require('goto-preview').goto_preview_references()<cr>", desc = 'goto_preview_references' },
  },
  config = function()
    require('goto-preview').setup({
      width = 120, -- Width of the floating window
      height = 30, -- Height of the floating window
      border = { '↖', '─', '┐', '│', '┘', '─', '└', '│' }, -- Border characters of the floating window
      default_mappings = false, -- Bind default mappings
      debug = false, -- Print debug information
      opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
      resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
      post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
      post_close_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
      references = { -- Configure the telescope UI for slowing the references cycling window.
        telescope = require('telescope.themes').get_dropdown({ hide_preview = false }),
      },
      -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
      focus_on_open = true, -- Focus the floating window when opening it.
      dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
      force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
      bufhidden = 'wipe', -- the bufhidden option to set on the floating window. See :h bufhidden
      stack_floating_preview_windows = true, -- Whether to nest floating windows
      preview_window_title = { enable = true, position = 'left' }, -- Whether to set the preview window title as the filename
    })

    Keymap(
      'n',
      'gpd',
      "<cmd>lua require('goto-preview').goto_preview_definition()<cr>",
      { desc = 'goto_preview_definition' }
    )
    Keymap(
      'n',
      'gpt',
      "<cmd>lua require('goto-preview').goto_preview_type_definition()<cr>",
      { desc = 'goto_preview_type_definition' }
    )
    Keymap(
      'n',
      'gpi',
      "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>",
      { desc = 'goto_preview_implementation' }
    )
    Keymap('n', 'gP', "<cmd>lua require('goto-preview').close_all_win()<cr>", { desc = 'close_all_win' })
    Keymap(
      'n',
      'gpr',
      "<cmd>lua require('goto-preview').goto_preview_references()<cr>",
      { desc = 'goto_preview_references' }
    )
  end,
}
