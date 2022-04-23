require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.formatting.prettier.with({
            prefer_local = "node_modules/.bin",
        }),

        require("null-ls").builtins.diagnostics.eslint.with({
            prefer_local = "node_modules/.bin",
        }),
    },
    -- format files on save
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
        end
    end,
})
