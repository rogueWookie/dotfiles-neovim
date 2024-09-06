return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-jest",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-jest")({
					jestCommand = "npx jest --verbose --",
					env = { CI = true },
					cwd = function(path)
						return vim.fn.getcwd()
					end,
				}),
			},
		})
		vim.keymap.set("n", "<leader>jf", function()
			require("neotest").run.run(vim.fn.expand("%"))
		end, { desc = "Run all tests" })
		vim.keymap.set("n", "<leader>jo", function()
			require("neotest").output.open({ enter = true })
		end, { desc = "Open test output" })
		-- vim.keymap.set("n", "<leader>jf", function()
		-- 	require("neotest").output.open({ enter = true })
		-- end, { desc = "Run nearest test in file" })
	end,
}
