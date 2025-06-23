return {
  'nvim-treesitter/nvim-treesitter',
  -- dependencies = {
  --   'nvim-treesitter/nvim-treesitter-textobjects',
  -- },
  event = 'BufEnter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'zig',
        'html',
        'xml',
        'css',
        'javascript',
        'typescript',
        'tsx',
        'go',
        'vue',
        'svelte',
        'lua',
        'http',
        'json',
        'vimdoc',
      },

      highlight = {
        enable = true,
        disable = function(_, buf)
          local max_filesize = 1024 * 1024 -- 1MB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },

      indent = {
        enable = false,
      },

      -- textobjects = {
      --   select = {
      --     keymaps = {
      --       ['aa'] = '@parameter.outer',
      --       ['ia'] = '@parameter.inner',
      --       ['af'] = '@function.outer',
      --       ['if'] = '@function.inner',
      --       ['ac'] = '@class.outer',
      --       ['ic'] = '@class.inner',
      --       ['ai'] = '@conditional.outer',
      --       ['ii'] = '@conditional.inner',
      --       ['ar'] = '@return.outer',
      --       ['ir'] = '@return.inner',
      --       ['al'] = '@loop.outer',
      --       ['il'] = '@loop.inner',
      --     },
      --   },
      -- },
    })
  end,
}
