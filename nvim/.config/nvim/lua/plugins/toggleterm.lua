return {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
  enabled = false,
  keys = {
    { '<leader>t', '<cmd>ToggleTerm<CR>', desc = 'Toggle Terminal' },
    { '<Space>lg', '<cmd>lua _lazygit_toggle<CR>', desc = 'Lazygit TUI' },
    { '<Space>lf', '<cmd>lua _lf_toggle<CR>', desc = 'lf TUI' },
  },
  config = function()
    require('toggleterm').setup()

    local Terminal = require('toggleterm.terminal').Terminal

    local function new_terminal_tool(cmd)
      return Terminal:new({
        cmd = cmd,
        dir = 'git_dir',
        direction = 'float',
        on_open = function(term)
          vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
        end,
      })
    end

    local lazygit = new_terminal_tool('lazygit')
    function _G._lazygit_toggle()
      lazygit:toggle()
    end

    local lf = new_terminal_tool('lf')
    function _G._lf_toggle()
      lf:toggle()
    end

    vim.keymap.set('n', '<Space>lg', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<Space>lf', '<cmd>lua _lf_toggle()<CR>', { noremap = true, silent = true })

    -- Terminal mappings
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      vim.keymap.set('t', '<leader>t', '<C-\\><C-n>:ToggleTerm<CR>')
    end
    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
  end,
}
