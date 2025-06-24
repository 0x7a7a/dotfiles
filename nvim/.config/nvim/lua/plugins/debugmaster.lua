return {
  {
    'miroshQa/debugmaster.nvim',
    -- osv is needed if you want to debug neovim lua code. Also can be used
    -- as a way to quickly test-drive the plugin without configuring debug adapters
    dependencies = {
      'leoluz/nvim-dap-go',
      'mfussenegger/nvim-dap',
      'jbyuki/one-small-step-for-vimkind',
    },
    config = function()
      local dm = require('debugmaster')
      -- make sure you don't have any other keymaps that starts with "<leader>d" to avoid delay
      -- Alternative keybindings to "<leader>d" could be: "<leader>m", "<leader>;"
      vim.keymap.set({ 'n', 'v' }, '<leader>D', dm.mode.toggle, { nowait = true })
      -- If you want to disable debug mode in addition to leader+d using the Escape key:
      vim.keymap.set('n', '<Esc>', dm.mode.disable)
      -- This might be unwanted if you already use Esc for ":noh"
      -- vim.keymap.set('t', '<C-\\>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

      dm.plugins.osv_integration.enabled = true -- needed if you want to debug neovim lua code
      -- local dap = require('dap')
      -- Configure your debug adapters here
      -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
      require('dap-go').setup({
        delve = {
          -- On Windows delve must be run attached or it crashes.
          -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
          detached = vim.fn.has('win32') == 0,
        },
      })
    end,
  },
}
