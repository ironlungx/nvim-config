return {
	"echasnovski/mini.nvim",
	enabled = true,
	config = function()
		-- local statusline = require("mini.statusline")
		-- statusline.setup({ use_icons = true })
		vim.o.laststatus = 3

		require("mini.pairs").setup({})
		require("mini.git").setup({})
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
