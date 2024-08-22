-- NOTE     This module overrides DAP UI's style symbols through creating a 
--          custom highlight group. Custom highlight group inherits from
--          special DAP UI highlight groups that provide more prominent colors.
--          This ensures that if the underlying colorscheme changes then the 
--          right colors will always take affect that align with the underlying
--          colorscheme.
return {
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
