return {
	"mfussenegger/nvim-dap",
	dependencies = {
		-- DAP UI Dependencies (recommended per docs)
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",

		-- Python DAP
		"mfussenegger/nvim-dap-python",

		-- C/C++/Rust DAP
		-- Only had to install codelldp package to host, update PATH and that
		-- was literally it. There's no plugin I need to call out for this in
		-- here.
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dap_python = require("dap-python")

		-- DAP UI Config
		-- Open/Close windows automatically (recommended per docs)
		-- https://github.com/rcarriga/nvim-dap-ui#usage
		-- TODO     Force dap to stay open after debug complete vs exiting
		dapui.setup()
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		--  DAP UI Config (Highlight Groups)
		--  Either 1) DapUI highlight groups are not being honored or do not
		--  exist for debug breakpoint symbol "B" and current debug line. I'm
		--  annoyed and just decided I would overrite native vim groups to get
		--  what i want. Obviously this is specific to nord so I would have to 
        --  change this if switching color schemes. Luckily i'm nord nerd and 
        --  don't anticipate changing.
		--      SignColumn  xxx guifg=#3b4252 guibg=#2e3440
		--      CursorLine  xxx guibg=#3b4252
		vim.api.nvim_set_hl(0, "SignColumn", { fg = "#b48ead", bg = "#2e3440", bold = true })
		vim.api.nvim_set_hl(0, "debugPC", { bg = "#3b4252" })

		-- DAP Config
		-- Key Bindings (recommended per docs)
		-- https://github.com/mfussenegger/nvim-dap/blob/master/doc/dap.txt
		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {
			desc = "dap.toggle_breakpoint",
		})
		vim.keymap.set("n", "<leader>dc", dap.continue, {
			desc = "dap.continue",
		})

		-- Python DAP Config
		-- Rolling w/ the defaults (recommended per docs)
		-- https://github.com/mfussenegger/nvim-dap-python
		dap_python.setup("python")

		-- C/C++/Rust DAP Config
		-- Rolling w/ the defaults (recommended per docs)
		-- https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(via--codelldb)#ccrust-via-codelldb
		-- NOTE     Must grab the codelldb vsix, see codelldb for details
		-- NOTE     Add codelldb bin to your path, simplifies "command" param
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
