return {
  {
    'milanglacier/minuet-ai.nvim',
    config = function()
      require('minuet').setup({
        blink = {
          enable_auto_complete = true,
        },
        virtualtext = {
          auto_trigger_ft = { 'go', 'zig', 'lua', 'js', 'ts', 'tsx', 'html', 'css', 'ini', 'http' },
          keymap = {
            accept = '<C-j>',
            accept_line = '<C-l>',
            accept_n_lines = nil,
            prev = nil,
            next = nil,
            dismiss = nil,
          },
        },
        provider = 'openai_compatible',
        provider_options = {
          claude = {
            api_key = 'OPENTOKEN_API_KEY',
            end_point = 'https://cn2.gw.opentoken.io/v1/messages',
            model = 'claude-opus-4-8',
            name = 'Opentoken_Claude',
            optional = {
              thinking = { type = 'disabled' },
            },
          },
          openai_compatible = {
            api_key = 'OPENTOKEN_API_KEY',
            end_point = 'https://cn2.gw.opentoken.io/v1/chat/completions',
            model = 'gpt-5.5',
            name = 'Opentoken_OpenAI',
            optional = {
              thinking = { type = 'disabled' },
            },
          },
        },
      })
    end,
  },
}
