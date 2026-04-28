return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			{
				"julianolf/nvim-dap-lldb",
				dependencies = { "mfussenegger/nvim-dap" },
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("dapui").setup()

			local cfg = {
				configurations = {
					-- C lang configurations
					c = {
						{
							name = "Launch debugger",
							type = "lldb",
							request = "launch",
							cwd = "${workspaceFolder}",
							program = function()
								return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
							end,
						},
					},
				},
			}

			cfg.configurations.cpp = cfg.configurations.c

			require("dap-lldb").setup(cfg)
			dap.configurations.cpp = dap.configurations.c

			require("keymap").dap()

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
		end,
	},
}
