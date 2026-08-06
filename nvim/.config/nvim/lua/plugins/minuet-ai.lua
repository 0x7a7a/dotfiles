return {
  'milanglacier/minuet-ai.nvim',
  enabled = false,
  config = function()
    require('minuet').setup({
      n_completions = 1,
      context_window = 512,
      throttle = 400,
      debounce = 200,

      blink = {
        enable_auto_complete = true,
      },
      virtualtext = {
        auto_trigger_ft = { 'go' },
        keymap = {
          accept = '<C-j>',
          accept_line = '<C-l>',
          accept_n_lines = nil,
          prev = nil,
          next = nil,
          dismiss = nil,
        },
      },
      provider = 'claude',
      provider_options = {
        claude = {
          api_key = 'OPENTOKEN_API_KEY',
          end_point = string.format('%s/v1/messages', os.getenv('OPENTOKEN_API_URL')),
          model = 'claude-opus-4-8',
          name = 'Opentoken_Claude',
          max_tokens = 256,
          optional = {
            thinking = { type = 'disabled' },
          },
        },
      },
    })
  end,
}
