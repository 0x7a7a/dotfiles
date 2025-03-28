return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    event = 'VeryLazy',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    },
    -- use 'luarocks install --lua-version 5.1 tiktoken_core' instead
    build = 'make tiktoken',
    config = function()
      local chat = require('CopilotChat')

      chat.setup({
        debug = false,
        proxy = '127.0.0.1:7890',
        allow_insecure = true,
        model = 'claude-3.5-sonnet',

        prompts = {
          COPILOT_INSTRUCTIONS = {
            system_prompt = 'You are now a senior software engineer who is familiar with multiple programming languages and development frameworks, and has an in-depth understanding of the software development life cycle. You are good at solving technical problems and have excellent logical thinking skills. Please answer the following questions for me in this role and respond in Chinese',
          },
        },
        chat_autocomplete = false,
      })

      vim.keymap.set('n', '<Space>c', '<Cmd>CopilotChatToggle<CR>')

      Z.autocmd('BufEnter', 'copilot-*', function()
        vim.o.number = false
        vim.o.relativenumber = false
        vim.o.foldcolumn = '0'
      end)
    end,
  },
}
