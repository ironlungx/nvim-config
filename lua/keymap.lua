local M = {}

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<M-,>", "<c-w>5<")
vim.keymap.set("n", "<M-.>", "<c-w>5>")
vim.keymap.set("n", "<M-t>", "<C-W>+")
vim.keymap.set("n", "<M-s>", "<C-W>-")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>p", '"+p')

vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>p", '"+p')

return {
	telescope = function() end,

	dap = function()
		local dap = require("dap")

		vim.keymap.set("n", "<space>b", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<space>gb", dap.run_to_cursor, { desc = "Run to cursor" })

		vim.keymap.set("n", "<F1>", dap.continue, { desc = "Debugger continue" })
		vim.keymap.set("n", "<F2>", dap.step_into, { desc = "Debugger step into" })
		vim.keymap.set("n", "<F3>", dap.step_over, { desc = "Debugger step over" })
		vim.keymap.set("n", "<F4>", dap.step_out, { desc = "Debugger step out" })
		vim.keymap.set("n", "<F5>", dap.step_back, { desc = "Debugger step back" })
		vim.keymap.set("n", "<F6>", dap.restart, { desc = "Debugger restart" })
		vim.keymap.set("n", "<F7>", dap.terminate, { desc = "Debugger terminate" })
	end,
}
