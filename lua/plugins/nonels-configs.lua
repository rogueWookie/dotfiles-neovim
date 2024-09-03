return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
        local utils = require("plugins.utils.nonels-utils")

		-- NOTE
		--  -   Following packages installed via Mason and setup w/ null-ls
		--  -   C/C++ Linting/Formatting already supported by clangd
		--  -   Some builtins not support see follwing link for list
		--      https://github.com/nvimtools/none-ls.nvim/discussions

        utils.setup()

		null_ls.setup({
			sources = {

				-- Lua Formatter
				-- INFO     https://github.com/JohnnyMorganz/StyLua

				null_ls.builtins.formatting.stylua,

				-- Ruby Formatter, Linter and LSP
				-- INFO     https://rubocop.org

				null_ls.builtins.diagnostics.rubocop,
				null_ls.builtins.formatting.rubocop,

				-- Mardown, YAML, JSON Formatter
				-- INFO     https://prettier.io
				-- NOTE     Requires npm and node installed to host

				null_ls.builtins.formatting.prettier,

				-- Python Formatter
				-- INFO     hptts://pypi.org/project/black

				null_ls.builtins.formatting.black,

				-- INFO     https://pypi.org/project/isort

				null_ls.builtins.formatting.isort,
			},
		})
	end,
}
