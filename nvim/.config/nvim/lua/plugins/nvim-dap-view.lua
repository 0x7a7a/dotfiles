return {
  'igorlfs/nvim-dap-view',
  opts = {
    winbar = {
      default_section = 'scopes',
    },
    auto_toggle = true,
  },
  config = function(_, opts)
    require('dap-view').setup(opts)

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('dap-view-keymaps', { clear = true }),
      pattern = { 'dap-view', 'dap-view-term', 'dap-repl' },
      callback = function(args)
        vim.keymap.set('n', 'q', '<C-w>q', {
          buffer = args.buf,
          desc = 'Close DAP window',
        })
      end,
    })
  end,
}
