return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    event = 'VeryLazy',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    },
    -- use 'luarocks install --lua-version 5.1 tiktoken_core' instead
    -- build = 'make tiktoken',
    config = function()
      local chat = require('CopilotChat')

      chat.setup({
        debug = false,
        proxy = '127.0.0.1:7890',
        allow_insecure = true,
        -- model = 'o1-preview-2024-09-12',
        model = 'claude-3.7-sonnet',

        mappings = {
          complete = {
            insert = '',
          },
        },

        prompts = {
          Explain = {
            prompt = '/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text in Chinease.',
          },
          Optimize = {
            prompt = '/COPILOT_GENERATE Optimize the selected code to improve performance and readability.Simple explanation in Chinese',
          },
        },

        chat_autocomplete = false,
      })

      vim.keymap.set('n', '<Space>c', '<Cmd>CopilotChatToggle<CR>')
      vim.keymap.set(
        'n',
        '<leader>cr',
        '<Cmd>CopilotChatReview<CR>',
        { desc = 'CopilotChat: Review the selected code' }
      )
      vim.keymap.set(
        'n',
        '<leader>ce',
        '<Cmd>CopilotChatExplain<CR>',
        { desc = 'CopilotChat: Explain for the active selection' }
      )
      vim.keymap.set(
        'n',
        '<leader>cp',
        '<Cmd>CopilotChatOptimize<CR>',
        { desc = 'CopilotChat: Optimize the selected code' }
      )
      vim.keymap.set(
        'n',
        '<leader>cd',
        '<Cmd>CopilotChatDocs<CR>',
        { desc = 'CopilotChat: Add documentation comment for the selection' }
      )

      Z.autocmd('BufEnter', 'copilot-*', function()
        vim.o.number = false
        vim.o.relativenumber = false
        vim.o.foldcolumn = '0'
      end)
    end,
  },
}
