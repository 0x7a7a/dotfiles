return {
  'lewis6991/gitsigns.nvim',
  opts = {
    on_attach = function(_bufnr)
      local gs = package.loaded.gitsigns

      -- Navigation
      Keymap('n', ']c', function()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return '<Ignore>'
      end, { expr = true, desc = 'next hunk' })

      Keymap('n', '[c', function()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return '<Ignore>'
      end, { expr = true, desc = 'prev hunk' })
    end,
  },
}
