require("plugins.utils.colors-utils").setup()
return {
	{
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nord").setup({})
			require("plugins.utils.colors-utils").set_colorscheme("nord")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("gruvbox").setup({})
		end,
	},
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({ flavour = "frappe" })
		end,
	},
}
