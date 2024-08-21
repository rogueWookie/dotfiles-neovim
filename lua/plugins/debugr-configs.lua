return {
	"mfussenegger/nvim-dap",
    -- INFO     https://github.com/mfussenegger/nvim-dap
	dependencies = {
		"rcarriga/nvim-dap-ui",
		-- INFO     https://github.com/rcarriga/nvim-dap-ui#usage
		"nvim-neotest/nvim-nio",
        -- INFO     https://github.com/nvim-neotest/nvim-nio

		-- Python DAP
		"mfussenegger/nvim-dap-python",

		-- C/C++/Rust DAP
        -- NOTE     download/install release from github and add to path
        -- INFO     https://github.com/vadimcn/codelldb    
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dap_python = require("dap-python")

		-- DAP UI Config
		dapui.setup()
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
        vim.keymap.set("n", "<leader>due", dapui.close, {
            noremap = true,
            silent = true,
            desc = "dapui.close"
        })
        -- TODO     Need to find better way to sync colors with nvim scheme and
        --          only change colors when in debug mode vs changing them all
        --          the time? Maybe not though, changing the globals really 
        --          was an improvement over the defaults. Still should sync to
        --          the nvim global theme though.
		vim.api.nvim_set_hl(0, "SignColumn", { fg = "#b48ead", bg = "#2e3440", bold = true })
		vim.api.nvim_set_hl(0, "debugPC", { bg = "#3b4252" })

		-- DAP Config
		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {
            noremap = true,
            silent = true,
			desc = "dap.toggle_breakpoint",
		})
		vim.keymap.set("n", "<leader>dc", dap.continue, {
            noremap = true,
            silent = true,
			desc = "dap.continue",
		})
		vim.keymap.set("n", "<leader>ds", dap.stop, {
            noremap = true,
            silent = true,
			desc = "dap.stop",
		})
		vim.keymap.set("n", "<leader>di", dap.step_into, {
            noremap = true,
            silent = true,
			desc = "dap.step_into",
		})
		vim.keymap.set("n", "<leader>do", dap.step_out, {
            noremap = true,
            silent = true,
			desc = "dap.step_out",
		})
		vim.keymap.set("n", "<leader>dv", dap.step_over, {
            noremap = true,
            silent = true,
			desc = "dap.step_over",
		})

		-- Python DAP Config
		-- INFO     https://github.com/mfussenegger/nvim-dap-python
		dap_python.setup("python")

		-- C/C++/Rust DAP Config
        -- INFO     Go to nvim-dap wiki, refer "C/C++/Rust (via codelldb)"
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = "codelldb",
				args = { "--port", "${port}" },
			},
		}
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}
		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp
	end,
}
