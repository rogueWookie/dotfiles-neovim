-- ABOUT    Custom LuaLine Color Toggling used for implementing key mappings
--          for changing the colors and updating states.lua. All key maps are
--          then assigned to a group so whichkey can play a role.
--
--          set_colorscheme     Calls into our custom state manipulation api to
--                              set a colorscheme that has been passed in.
--          load_colorscheme    Attempts to load a colorscheme using custom
--                              state manipulation api, if there's an error, it
--                              defaults to using the nord colorscheme
--          setup               Called by lualin-configs.lua such that key maps
--                              are setup and ready to use.

local states_utils = require("plugins.utils.states-utils")

return {

    -- ------------------------------------------------------------------------
	set_colorscheme = function(scheme)
		require("lualine").setup({ options = { theme = scheme } })
		states_utils.set_value("lualine", scheme)
	end,

    -- ------------------------------------------------------------------------
	load_colorscheme = function()
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				local color = states_utils.get_value("lualine") or "nord"
				require("lualine").setup({ options = { theme = color } })
			end,
		})
	end,

    -- ------------------------------------------------------------------------
	setup = function()
		local utils = require("plugins.utils.lualin-utils")
		utils.load_colorscheme()

		vim.api.nvim_set_keymap(
			"n",
			"<leader>un",
			":lua require('plugins.utils.lualin-utils').set_colorscheme('nord')<CR>",
			{ noremap = true, silent = true, desc = "nord dark" }
		)

		vim.api.nvim_set_keymap(
			"n",
			"<leader>ug",
			":lua require('plugins.utils.lualin-utils').set_colorscheme('gruvbox')<CR>",
			{ noremap = true, silent = true, desc = "gruvbox dark" }
		)

		vim.api.nvim_set_keymap(
			"n",
			"<leader>uc",
			":lua require('plugins.utils.lualin-utils').set_colorscheme('dracula')<CR>",
			{ noremap = true, silent = true, desc = "catppuccin frappe" }
		)
	end,
}
