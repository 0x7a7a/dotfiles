return {
  'ggandor/leap.nvim',
  enabled = false,
  dependencies = { 'tpope/vim-repeat' },
  config = function()
    require('leap').setup({
      max_aot_targets = nil,
      highlight_unlabeled = false,
      max_highlighted_traversal_targets = 10,
      case_sensitive = false,
      equivalence_classes = { ' \t\r\n' },
      substitute_chars = {},
      special_keys = {
        repeat_search = '<enter>',
        next_phase_one_target = '<enter>',
        next_target = { '<enter>', ';' },
        prev_target = { '<tab>', ',' },
        next_group = '<space>',
        prev_group = '<tab>',
        multi_accept = '<enter>',
        multi_revert = '<backspace>',
      },
    })

    -- require('leap').set_default_keymaps()
    Keymap('n', 's', '<Plug>(leap-forward)')
    Keymap('n', 'S', '<Plug>(leap-backward)')
  end,
}
