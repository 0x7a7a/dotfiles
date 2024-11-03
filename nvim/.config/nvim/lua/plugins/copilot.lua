return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    keys = {
      { '<Space>c', '<Cmd>CopilotChatToggle<CR>' },
      { '<leader>cr', '<Cmd>CopilotChatReview<CR>', desc = 'CopilotChat: Review the selected code' },
      { '<leader>ce', '<Cmd>CopilotChatExplain<CR>', desc = 'CopilotChat: Explain for the active selection' },
      { '<leader>cp', '<Cmd>CopilotChatOptimize<CR>', desc = 'CopilotChat: Optimize the selected code' },
      { '<leader>cd', '<Cmd>CopilotChatDocs<CR>', desc = 'CopilotChat: Add documentation comment for the selection' },
    },
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    },
    -- use 'luarocks install --lua-version 5.1 tiktoken_core' instead
    -- build = 'make tiktoken',
    config = function()
      local chat = require('CopilotChat')
      -- Registers copilot-chat source and enables it for copilot-chat filetype (so copilot chat window)
      require('CopilotChat.integrations.cmp').setup()

      chat.setup({
        debug = false,
        allow_insecure = true,
        -- model = 'o1-preview-2024-09-12',
        model = 'claude-3.5-sonnet',

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
      })

      Z.autocmd('BufEnter', 'copilot-*', function()
        vim.o.number = false
        vim.o.relativenumber = false
        vim.o.foldcolumn = '0'
      end)
    end,
  },
}
