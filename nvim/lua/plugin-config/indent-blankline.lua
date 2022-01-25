vim.opt.termguicolors = true
vim.opt.list = true

require("indent_blankline").setup {
    filetype_exclude = {"startify", "dashboard", "dotooagenda", "log", "fugitive", "gitcommit", "packer", "vimwiki",
                        "markdown", "json", "txt", "vista", "help", "todoist", "NvimTree", "peekaboo", "git",
                        "TelescopePrompt", "undotree", "flutterToolsOutline", "" -- for all buffers without a file type
    },
    buftype_exclude = {"terminal", "nofile"},
    show_current_context_start = false,
    show_current_context = true
}
