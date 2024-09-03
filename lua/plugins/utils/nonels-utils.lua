return {
	setup = function()
		vim.diagnostic.config({
			virtual_text = false, -- Disable virtual text
			signs = true, -- Disable signs in the sign column
			underline = false, -- Disable underlines for diagnostics
			update_in_insert = false, -- Do not update diagnostics in insert mode
			severity_sort = true, -- Optionally sort diagnostics by severity
		})
		vim.keymap.set("n", "<leader>fd", function()
			vim.diagnostic.open_float(nil, { focusable = false, border = "rounded" })
		end, { noremap = true, silent = true, desc = "Show diagnostics" })
		vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {
			noremap = true,
			silent = true,
			desc = "vim.lsp.buf.format",
		})
	end,
}
