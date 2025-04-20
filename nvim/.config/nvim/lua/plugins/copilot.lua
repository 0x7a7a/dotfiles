return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  opts = {
    panel = {
      enabled = true,
    },
    suggestion = {
      enabled = true,
      -- auto_trigger = true,
      -- hide_during_completion = true,
      -- debounce = 75,
      -- keymap = {
      --   accept = '<C-j>',
      --   accept_word = false,
      --   accept_line = false,
      --   next = '<C-]>',
      --   prev = '<C-[>',
      --   dismiss = nil,
      -- },
    },
  },
}
