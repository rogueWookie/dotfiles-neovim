return {
	"folke/which-key.nvim",

	-- Dependencies called out in which-key per docs
	dependencies = {
		"echasnovski/mini.icons",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local config = require("which-key")
		config.setup({

			-- This padding fits nicely with helix
			preset = "helix",
			win = {
				padding = { 1, 4 },
			},

			-- Register custom mappings. Lets try to maintain some consistency
			-- by group classification per plugin.
			spec = {
				{ "<leader>d", group = "Debugger" },
				{ "<leader>l", group = "LSPs", icon = "󱔽" },
				{ "<leader>t", group = "Telescope" },
				{ "<leader>f", group = "Formatters" },
				{ "<leader>n", group = "NeoTree", icon = "" },
			},
		})
	end,
}
