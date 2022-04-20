local basic = require("lsp/basic")

require("lspconfig").gopls.setup({
    capabilities = basic.capabilities,
    on_attach = function(client, bufnr)
        basic.on_attach(client, bufnr)
    end,

    filetypes = { 'go', 'gomod', 'gohtmltmpl', 'gotexttmpl' },
    message_level = vim.lsp.protocol.MessageType.Error,
    cmd = {
        'gopls', -- share the gopls instance if there is one already
        -- '-remote=auto', --[[ debug options ]] --
        -- "-logfile=auto",
        -- "-debug=:0",
        -- '-remote.debug=:0',
        -- "-rpc.trace",
    },

    flags = { allow_incremental_sync = true, debounce_text_changes = 1000 },
    settings = {
        gopls = {
            -- more settings: https://github.com/golang/tools/blob/master/gopls/doc/settings.md
            -- flags = {allow_incremental_sync = true, debounce_text_changes = 500},
            -- not supported
            analyses = { unusedparams = true, unreachable = false },
            codelenses = {
                generate = true, -- show the `go generate` lens.
                gc_details = true, --  // Show a code lens toggling the display of gc's choices.
                test = true,
                tidy = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            matcher = 'fuzzy',
            diagnosticsDelay = '500ms',
            experimentalWatchedFileDelay = '1000ms',
            symbolMatcher = 'fuzzy',
            gofumpt = false, -- true, -- turn on for new repos, gofmpt is good but also create code turmoils
            buildFlags = { '-tags', 'integration' },
            -- buildFlags = {"-tags", "functional"}
        }
    }
})
