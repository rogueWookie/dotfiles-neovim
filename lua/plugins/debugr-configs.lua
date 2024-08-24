return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
        local utils = require("plugins.utils.debugr-utils")
		local dap_python = require("dap-python")

		vim.keymap.set("n", "<leader>due", dapui.close, {
			noremap = true,
			silent = true,
			desc = "dapui.close",
		})
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

		-- DAP UI Config & Listerns
        -- NOTE     It's nice to have DAP UI attach & pop open automatically

		dapui.setup()
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end

        -- Utilities Configuration

        utils.setup()

		-- Python DAP Config

		dap_python.setup("python")

		-- C/C++/Rust DAP Configuration
		-- INFO     grap vadimcn/codelldp release from github, update PATH
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
