local function toggle_diffview(cmd)
  if next(require('diffview.lib').views) == nil then
    vim.cmd(cmd)
  else
    vim.cmd('DiffviewClose')
  end
end

-- Cookbook: https://www.naseraleisa.com/posts/diff
return {
  'sindrets/diffview.nvim',
  evet = 'VeryLazy',
  enabled = false,
  keys = {
    {
      '<Space>dh',
      function()
        toggle_diffview('DiffviewFileHistory %')
      end,
      desc = 'Diffview repo history',
    },
    {
      '<Space>dv',
      function()
        toggle_diffview('DiffviewOpen')
      end,
      desc = 'Diffview open',
    },
  },
}
