return {
  {
    'igorlfs/nvim-dap-view',
    lazy = false,
    opts = {
      winbar = {
        default_section = 'scopes',
      },
      auto_toggle = true,
    },
    config = function()
      require('dap-view').setup({
        winbar = {
          default_section = 'scopes',
        },
        auto_toggle = true,
      })

      vim.api.nvim_create_autocmd({ 'FileType' }, {
        pattern = { 'dap-view', 'dap-view-term', 'dap-repl' }, -- dap-repl is set by `nvim-dap`
        callback = function(args)
          vim.keymap.set('n', 'q', '<C-w>q', { buffer = args.buf })
        end,
      })
    end,
  },
}
