return {
	"folke/which-key.nvim",
	dependencies = {
		"echasnovski/mini.icons",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local config = require("which-key")
		config.setup({
			preset = "helix",
			win = {
				padding = { 1, 4 },
			},
			spec = {
				{ "<leader>d",  group = "Debugger" },
                { "<leader>du", group = "Debugger UI", icon = "" },
				{ "<leader>l",  group = "LSPs", icon = "󱔽" },
				{ "<leader>t",  group = "Telescope" },
				{ "<leader>f",  group = "Formatters" },
				{ "<leader>n",  group = "NeoTree", icon = "" },
			},
		})
	end,
}
