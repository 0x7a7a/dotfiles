return {
  'zbirenbaum/copilot.lua',
  opts = {
    panel = {
      enabled = false,
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      hide_during_completion = true,
      debounce = 75,
      keymap = {
        -- accept = '<M-l>',
        accept = '<C-j>',
        accept_word = false,
        accept_line = false,
        next = '<C-]>',
        prev = '<C-[>',
        dismiss = nil,
      },
    },
  },
}
