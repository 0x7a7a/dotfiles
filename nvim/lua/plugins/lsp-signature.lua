local cfg = {
    bind = true,
    doc_lines = 10,
    handler_opts = {
        border = "rounded"
    },
    floating_window = false,
    toggle_key = "<C-k>",
    -- fix_pos = function(signatures, client)
    --     print(vim.inspect(signatures))
    -- end
}

require("lsp_signature").setup(cfg)
