require('navigator').setup({
    default_mapping = false,
    keymaps = {},
    lsp_installer = false,
    lsp = {
        format_on_save = false,
        disable_lsp = 'all',
        diagnostic = {
            underline = true,
            virtual_text = false,
            update_in_insert = false,
        },
    }
})

Keymap("n", "<C-space>", ":lua require('navigator.codeAction').code_action()<CR>")
Keymap("i", "<C-space>", ":lua require('navigator.codeAction').code_action()<CR>")
Keymap("n", "R", ":lua require('navigator.rename').rename()<CR>")
Keymap("n", "gk", ":lua vim.lsp.buf.hover()<CR>")
Keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>")
Keymap("n", "gp", ":lua require('navigator.definition').definition_preview()<CR>")
Keymap("n", "gr", ":lua require('navigator.reference').reference()<CR>")
