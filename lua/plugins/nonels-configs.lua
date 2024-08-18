return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		-- NOTE
		--  -   Following packages installed via Mason and setup w/ null-ls
		--  -   C/C++ Linting/Formatting already supported by clangd
		--  -   Some builtins not support seeing follwing link for list
		--      https://github.com/nvimtools/none-ls.nvim/discussions
		--  -   Some packages have host dependencies (e.g. npm, node)

		null_ls.setup({
			sources = {
				-- Lua Formatter
				-- Stylua - https://github.com/JohnnyMorganz/StyLua
				null_ls.builtins.formatting.stylua,

				-- Ruby Formatter, Linter and LSP
				-- Rubocop - https://rubocop.org
				null_ls.builtins.diagnostics.rubocop,
				null_ls.builtins.formatting.rubocop,

				-- Mardown, YAML, JSON Formatter
				-- https://prettier.io
				-- Requires npm and node
				null_ls.builtins.formatting.prettier,

				-- Python Formatter
				-- Black - hptts://pypi.org/project/black
				null_ls.builtins.formatting.black,
				-- isort - https://pypi.org/project/isort
				null_ls.builtins.formatting.isort,
			},
		})

		--  Formatter
		vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {
			desc = "vim.lsp.buf.format",
		})
	end,
}
