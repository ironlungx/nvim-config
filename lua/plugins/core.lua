return {
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin-frappe",
			icons = {
				diagnostics = {
					Error = " ",
					Warn = " ",
					Hint = " ",
					Info = " ",
				},
			},
		},
	},

	{ import = "lazyvim.plugins.extras.lang.json" },
	{ import = "lazyvim.plugins.extras.lang.toml" },
	{ import = "lazyvim.plugins.extras.lang.toml" },
	{ import = "lazyvim.plugins.extras.lang.clangd" },
	{ import = "lazyvim.plugins.extras.lang.rust" },
	{ import = "lazyvim.plugins.extras.lang.nix" },
	{ import = "lazyvim.plugins.extras.coding.mini-surround" },

	{
		"mason-org/mason.nvim",
		enabled = false,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		enabled = false,
	},
	{
		"snacks.nvim",
		opts = {
			scroll = { enabled = false },
		},
	},
	{
		"sphamba/smear-cursor.nvim",
		event = "VeryLazy",
		cond = vim.g.neovide == nil,
		opts = {
			hide_target_hack = true,
			cursor_color = "none",
		},
		specs = {
			-- disable mini.animate cursor
			{
				"nvim-mini/mini.animate",
				optional = true,
				opts = {
					cursor = { enable = false },
				},
			},
		},
	},
}
