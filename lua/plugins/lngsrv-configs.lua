return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			-- Lua Language Server
			lspconfig.lua_ls.setup({})
			-- C/C++ Language Server
			lspconfig.clangd.setup({})
			-- Python Language Server
			-- lspconfig.pyright.setup({})

			-- :h vim.lsp.buf.hover
			vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, {
				desc = "lsp.buf.hover",
			})
			-- :h vim.lsp.buf.definition
			vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, {
				desc = "lsp.buf.definition",
			})
			-- :h vim.lsp.buf.code_action
			vim.keymap.set({ "n", "v" }, "<leader>lc", vim.lsp.buf.code_action, {
				desc = "lsp.buf.code_action",
			})
		end,
	},
}
