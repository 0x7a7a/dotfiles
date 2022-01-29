require("bufferline").setup({
	options = {
		numbers = function(opts)
			-- return string.format("%s·%s", opts.ordinal, opts.raise(opts.id))
			return string.format("%s.", opts.ordinal)
		end,
		indicator_icon = "▎",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 18,
		max_prefix_length = 15,
		tab_size = 18,
		show_buffer_close_icons = false,
		show_buffer_icons = true,
		show_tab_indicators = true,
		diagnostics = "nvim_lsp",
		always_show_bufferline = true,
		-- "slant" | "thick" | "thin" | { 'any', 'any' },
		separator_style = "slant",
		offsets = {
			{
				filetype = "NvimTree",
				text = function()
					return vim.fn.getcwd()
				end,
				highlight = "Directory",
				text_align = "left",
			},
		},
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or "")
				s = s .. n .. sym
			end
			return s
		end,
	},
})
