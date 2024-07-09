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

      -- Navigation
      Keymap('n', ']c', next_hunk, { expr = true, desc = 'Next git hunk' })
      Keymap('n', '[c', prev_hunk, { expr = true, desc = 'Prev git hunk' })
      Keymap('n', '<leader>gp', gs.preview_hunk, { desc = 'Gitsigns: preview diff hunk' })
      Keymap('n', '<leader>grh', gs.reset_hunk, { desc = 'Gitsigns: reset diff hunk over cursor' })
      Keymap('n', '<leader>grb', gs.reset_buffer, { desc = 'Gitsigns: reset diff for entire buffer' })
      Keymap('n', '<leader>gb', gs.blame_line, { desc = 'Gitsigns: blame line' })
    end,

    -- current_line_blame = true,
  },
}
