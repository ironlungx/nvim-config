return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
	},
	keys = {
		{ "<leader>ff", mode = "n", desc = "Find Files" },
		{ "<leader>fh", mode = "n", desc = "Find Help" },
		{ "<leader>fo", mode = "n", desc = "Find Old Files" },
		{ "<leader><leader>", mode = "n", desc = "Find Buffers" },
		{ "<leader>fg", mode = "n", desc = "File grep" },
	},
	config = function()
		require("telescope").setup({
			extensions = {
				fzf = {},
			},
		})

		require("telescope").load_extension("fzf")
    require("telescope").load_extension("ui-select")

		vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
		vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)
		vim.keymap.set("n", "<leader>fo", require("telescope.builtin").oldfiles)
		vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep)
		vim.keymap.set("n", "<leader><leader>", require("telescope.builtin").buffers)
	end,
}
