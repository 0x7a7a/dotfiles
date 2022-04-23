require("indent_blankline").setup({
  show_end_of_line = false,

  filetype_exclude = {
    "startify",
    "dashboard",
    "dotooagenda",
    "log",
    "fugitive",
    "gitcommit",
    "packer",
    "vimwiki",
    "markdown",
    "json",
    "txt",
    "vista",
    "help",
    "todoist",
    "NvimTree",
    "peekaboo",
    "git",
    "TelescopePrompt",
    "undotree",
    "flutterToolsOutline",
    "", -- for all buffers without a file type
  },
  buftype_exclude = { "terminal", "nofile" },
  show_current_context_start = false,
  show_current_context = true,
})

-- vim.opt.list = true
-- vim.opt.listchars:append("eol:↴")
vim.opt.termguicolors = true
