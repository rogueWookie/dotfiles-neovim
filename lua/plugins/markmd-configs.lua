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
    -- TODO     Supress wrapping mode from showing in stdout
    -- TODO     Fix this undefined global issue, surpressing for now
	{
		"andrewferrier/wrapping.nvim",
		config = function()
			require("wrapping").setup({
				notify_on_switch = true,
			})
			---@diagnostic disable-next-line: undefined-global
			vim.cmd("SoftWrapMode")
		end,
	},
}
