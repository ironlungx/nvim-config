-- Not to be confused with Xen which is a half life reference :cold_face_emoji: (very cold)

-- Lua
return {
	{
		"folke/twilight.nvim",
		opts = {
			dimming = {
				alpha = 0.25, -- amount of dimming
				-- we try to get the foreground from the highlight groups or fallback color
				inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
			},
			context = 15, -- amount of lines we will try to show around the current line
			treesitter = true, -- use treesitter when available for the filetype
			-- treesitter is used to automatically expand the visible text,
			-- but you can further control the types of nodes that should always be fully expanded
			expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
				"function",
				"method",
				"table",
				"if_statement",
			},
			exclude = {}, -- exclude these filetypes
		},
	},
	{
		"folke/zen-mode.nvim",
		config = function()
			-- Toggle Zen Mode with 85% window width
			vim.keymap.set(
				"n",
				"<leader>z",
				":lua require('zen-mode').toggle({ window = { width = 0.85 } })<CR>",
				{ silent = true }
			)
		end,
		opts = {
			window = {
				width = 0.8,
			},
			plugins = {
				tmux = { enabled = true },
			},
		},
		keys = {
			{ "<leader>z", mode = "n", desc = "toggle zen mode" },
		},
	},
}
