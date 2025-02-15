return {
  'folke/snacks.nvim',
  enabled = false,
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
  },
  keys = {
    -- Find
    {
      '<C-p>',
      function()
        Snacks.picker.files({ preview = false })
      end,
      desc = 'Find Files',
    },
    {
      '<C-\\>',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Buffers',
    },
    {
      '<Space>/',
      function()
        Snacks.picker.lines()
      end,
      desc = 'Grep buffer lines',
    },
    {
      '<Space>sg',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Grep',
    },
    {
      '<Space>ss',
      function()
        Snacks.picker.resume()
      end,
      desc = 'Resume',
    },
    {
      '<Space>sh',
      function()
        Snacks.picker.help()
      end,
      desc = 'Help Pages',
    },
    {
      '<Space>sd',
      function()
        Snacks.picker.diagnostics()
      end,
      desc = 'Diagnostics',
    },
    {
      '<Space>sc',
      function()
        Snacks.picker.commands()
      end,
      desc = 'Commands',
    },
    {
      '<Space>sr',
      function()
        Snacks.picker.registers()
      end,
      desc = 'Registers',
    },
    -- LSP
    {
      'gd',
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = 'Goto Definition',
    },
    {
      'gD',
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = 'Goto Declaration',
    },
    {
      'grr',
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = 'References',
    },
    {
      'gri',
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = 'Goto Implementation',
    },
    {
      'gy',
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = 'Goto T[y]pe Definition',
    },
    {
      '<Space>sa',
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = 'LSP Symbols',
    },
    {
      '<Space>sA',
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = 'LSP Workspace Symbols',
    },
  },
}
