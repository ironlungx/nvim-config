return {
	"echasnovski/mini.nvim",
	dependencies = { "echasnovski/mini.extra" },
	enabled = true,
	lazy = false,

	keys = {
		{ "<leader>ff", mode = "n", desc = "Find Files" },
		{ "<leader>fh", mode = "n", desc = "Find Help" },
		{ "<leader>fb", mode = "n", desc = "Find Buffers" },
		{ "<leader>fg", mode = "n", desc = "File grep" },
		{ "<leader>ls", mode = "n", desc = "LSP Symbols" },
	},

	config = function()
		-- local statusline = require("mini.statusline")
		-- statusline.setup({ use_icons = true })
		vim.o.laststatus = 3

		require("mini.pairs").setup({})
		require("mini.git").setup({})
		require("mini.pick").setup({})

		local pick = require("mini.pick")
		local pick_extra = require("mini.extra")

		vim.keymap.set("n", "<leader>ff", pick.builtin.files)
		vim.keymap.set("n", "<leader>fh", pick.builtin.help)
		vim.keymap.set("n", "<leader>fg", pick.builtin.grep)
		vim.keymap.set("n", "<leader>fb", pick.builtin.buffers)
		vim.keymap.set("n", "<leader>ls", function()
			pick_extra.pickers.lsp({ scope = "document_symbol" })
		end)

		-- 		require("mini.starter").setup({
		-- 			header = [[┌─────────────────────────────────────────────────────────────────┐
		-- │                     ,                                           │
		-- │                     \`-._           __                          │
		-- │                      \\  \-..____,.'  `.                        │
		-- │                       :  )       :      :\                      │
		-- │                        ;'        '   ;  | :                     │
		-- │                        )..      .. .:.`.; :                     │
		-- │                       /::...  .:::...   ` ;                     │
		-- │                       `:o>   /\o_>        : `.                  │
		-- │                      `-`.__ ;   __..--- /:.   \                 │
		-- │                     ==== \_/   ;=====_.':.     ;                │
		-- │                       ,/'`--'...`--....        ;                │
		-- │                            ;                    ;               │
		-- │                        . '                       ;              │
		-- │                      .'     ..     ,      .       ;             │
		-- │                     :       ::..  /      ;::.     |             │
		-- │                    /      `.;::.  |       ;:..    ;             │
		-- │                   :         |:.   :       ;:.    ;              │
		-- │                   :         ::     ;:..   |.    ;               │
		-- │                    :       :;      :::....|     |               │
		-- │                    /\     ,/ \      ;:::::;     ;               │
		-- │                  .:. \:..|    :     ; '.--|     ;               │
		-- │                 ::.  :''  `-.,,;     ;'   ;     ;               │
		-- │              .-'. _.'\      / `;      \,__:      \              │
		-- │              `---'    `----'   ;      /    \,.,,,/              │
		-- │                                 `----`                          │
		-- └─────────────────────────────────────────────────────────────────┘
		--        ]],
		-- 		})
	end,
}
