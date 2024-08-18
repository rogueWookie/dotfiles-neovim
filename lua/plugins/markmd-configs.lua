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
}
