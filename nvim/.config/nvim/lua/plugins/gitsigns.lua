return {
  'lewis6991/gitsigns.nvim',
  opts = {
    on_attach = function(_bufnr)
      local gs = package.loaded.gitsigns

      local function next_hunk()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return '<Ignore>'
      end

      local function prev_hunk()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return '<Ignore>'
      end

      vim.keymap.set('n', ']c', next_hunk, { expr = true, desc = 'Next git hunk' })
      vim.keymap.set('n', '[c', prev_hunk, { expr = true, desc = 'Prev git hunk' })
      vim.keymap.set('n', '<leader>gp', gs.preview_hunk, { desc = 'Gitsigns: preview diff hunk' })
      vim.keymap.set('n', '<leader>grh', gs.reset_hunk, { desc = 'Gitsigns: reset diff hunk over cursor' })
      vim.keymap.set('n', '<leader>grb', gs.reset_buffer, { desc = 'Gitsigns: reset diff for entire buffer' })
      vim.keymap.set('n', '<leader>gb', gs.blame_line, { desc = 'Gitsigns: blame line' })
    end,

    -- current_line_blame = true,
  },
}
