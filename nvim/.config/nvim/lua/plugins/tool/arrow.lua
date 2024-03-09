return {
  'otavioschwanck/arrow.nvim',
  evet = 'VeryLazy',
  -- stylua: ignore
  keys = {
    { '<C-e>', function() require('arrow.persist').toggle() end },
    { '<A-h>', function() require('arrow.persist').previous() end },
    { '<A-l>', function() require('arrow.persist').next() end },
    -- { '<A-1>', function() require('arrow.persist').go_to(1) end },
    -- { '<A-2>', function() require('arrow.persist').go_to(2) end },
    -- { '<A-3>', function() require('arrow.persist').go_to(3) end },
    -- { '<A-4>', function() require('arrow.persist').go_to(4) end },
  },
  config = function()
    require('arrow').setup({
      show_icons = true,
      leader_key = '<C-e>',
      -- index_keys = "123456789zxcbnmZXVBNM,afghjklAFGHJKLwrtyuiopWRTYUIOP",
      index_keys = 'hjkl;',
    })
  end,
}
