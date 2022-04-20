require 'navigator'.setup({
    debug = false, -- log output, set to true and log path: ~/.cache/nvim/gh.log
    width = 0.75, -- max width ratio (number of cols for the floating window) / (window width)
    height = 0.3, -- max list window height, 0.3 by default
    preview_height = 0.35, -- max height of preview windows
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- border style, can be one of 'none', 'single', 'double',
    -- 'shadow', or a list of chars which defines the border
    on_attach = function(client, bufnr)
        -- basic.on_attach(client, bufnr)
        -- your hook
    end,
    -- put a on_attach of your own here, e.g
    -- function(client, bufnr)
    --   -- the on_attach will be called at end of navigator on_attach
    -- end,
    -- The attach code will apply to all LSP clients

    default_mapping = false, -- set to false if you will remap every key
    keymaps = {}, -- a list of key maps
    -- this kepmap gK will override "gD" mapping function declaration()  in default kepmap
    -- please check mapping.lua for all keymaps
    treesitter_analysis = true, -- treesitter variable context
    transparency = 50, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil or 100 to disable it

    lsp_signature_help = false, -- if you would like to hook ray-x/lsp_signature plugin in navigator
    -- setup here. if it is nil, navigator will not init signature help
    signature_help_cfg = nil, -- if you would like to init ray-x/lsp_signature plugin in navigator, and pass in your own config to signature help
    icons = {
        -- Code action
        code_action_icon = "🏏",
        -- Diagnostics
        diagnostic_head = '🐛',
        diagnostic_head_severity_1 = "🈲",
        -- refer to lua/navigator.lua for more icons setups
    },
    lsp_installer = false, -- set to true if you would like use the lsp installed by williamboman/nvim-lsp-installer
    lsp = {
        code_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
        code_lens_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
        format_on_save = false, -- set to false to disable lsp code format on save (if you are using prettier/efm/formater etc)
        disable_format_cap = { "sqls", "sumneko_lua", "gopls" }, -- a list of lsp disable format capacity (e.g. if you using efm or vim-codeformat etc), empty {} by default
        disable_lsp = 'all', -- a list of lsp server disabled for your project, e.g. denols and tsserver you may
        -- only want to enable one lsp server
        -- to disable all default config and use your own lsp setup set
        -- disable_lsp = 'all'
        -- Default {}
        diagnostic = {
            underline = true,
            virtual_text = false,
            update_in_insert = false, -- update diagnostic message in insert mode
        },

        diagnostic_scrollbar_sign = { '▃', '▆', '█' }, -- experimental:  diagnostic status in scroll bar area; set to false to disable the diagnostic sign,
        -- for other style, set to {'╍', 'ﮆ'} or {'-', '='}
        diagnostic_virtual_text = false, -- show virtual for diagnostic message
        diagnostic_update_in_insert = false, -- update diagnostic message in insert mode
        disply_diagnostic_qf = true, -- always show quickfix if there are diagnostic errors, set to false if you  want to ignore it
    }
})
