-- ABOUT    Custom DAP UI Overrides for styling symbols that appear in the DAP
--          UI (e.g. SignColumn, etc). Colors are inherited from other DAP UI
--          hl groups which ensures colors are compatible with their underlying
--          colorscheme should the colorscheme update.
--
--          setup   Called from debugr-configs.lua
return {

    -- ------------------------------------------------------------------------
	setup = function()
		local err_color = vim.api.nvim_get_hl_by_name("DapUIStop", true)

		vim.api.nvim_set_hl(0, "DapBreakpoint", {
			ctermbg = 0,
			fg = string.format("#%06x", err_color.foreground),
			bg = "none",
		})

		vim.fn.sign_define("DapBreakpoint", {
			text = "",
			texthl = "DapBreakpoint",
			linehl = "",
			numhl = "",
		})

		local exe_color = vim.api.nvim_get_hl_by_name("DapUIThread", true)

		vim.api.nvim_set_hl(0, "DapStopped", {
			ctermbg = 0,
			fg = string.format("#%06x", exe_color.foreground),
			bg = "none",
		})

		vim.fn.sign_define("DapStopped", {
			text = "",
			texthl = "DapStopped",
			linehl = "",
			numhl = "",
		})
	end,
}
