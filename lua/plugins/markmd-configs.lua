return {
	{
		"folke/zen-mode.nvim",
		config = function()
			local config = require("zen-mode")
			config.setup({
				window = {
					width = 80,
				},
			})
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local config = require("render-markdown")
			config.setup({
				link = {
					enabled = false,
				},
			})
		end,
	},
	{
		"andrewferrier/wrapping.nvim",
		config = function()
			require("wrapping").setup({
				notify_on_switch = false,
			})
			vim.cmd("SoftWrapMode")
		end,
	},
}
