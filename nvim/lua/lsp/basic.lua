local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local opts = {
	noremap = true,
	silent = true,
}
M.on_attach = function(client, bufnr)
	-- 高亮同名变量
	require("illuminate").on_attach(client)
	vim.api.nvim_command([[ hi def link LspReferenceText CursorLine ]])
	vim.api.nvim_command([[ hi def link LspReferenceWrite CursorLine ]])
	vim.api.nvim_command([[ hi def link LspReferenceRead CursorLine ]])

	-- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

    -- format files on save
    if client.resolved_capabilities.document_formatting then
        vim.cmd([[
        augroup LspFormatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
        ]])
    end
end

return M
