local current_signature = function(width)
    local sig = require("lsp_signature").status_line(width)
    return sig.label .. "🐼" .. sig.hint
end

require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "auto",
        disabled_filetypes = {},
        component_separators = "|",
        section_separators = {
            left = "",
            right = ""
        }
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {{"branch"}, {"diff"}},
        lualine_c = {{
            "diagnostics",
            sources = {'nvim_diagnostic'},
            symbols = {
                error = " ",
                warn = " ",
                info = " "
            }
        }},

        lualine_x = {require('auto-session-library').current_session_name},
        lualine_y = {"filetype", "encoding", "fileformat"},
        lualine_z = {"progress", "location"}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    -- extensions = {"quickfix", "nvim-tree", "toggleterm", "fugitive", symbols_outline}
    extensions = {"nvim-tree", "toggleterm", "fugitive"}
}
