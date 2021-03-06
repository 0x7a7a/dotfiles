require('nvim-autopairs').setup {
  disable_filetype = { 'TelescopePrompt', 'guihua', 'guihua_rust', 'clap_input' },
}
if vim.o.ft == 'clap_input' and vim.o.ft == 'guihua' and vim.o.ft == 'guihua_rust' then
  require('cmp').setup.buffer { completion = { enable = false } }
end

-- If you want insert `(` after select function or method item
local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local cmp = require 'cmp'
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done {
    map_char = {
      tex = '',
    },
  }
)
