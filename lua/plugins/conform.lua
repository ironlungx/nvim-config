return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			cpp = { "clang-format" },
			nix = { "alejandra" },
			python = { "black" },
			lua = { "stylua" },
			json = { "fixjson" },
			jsonc = { "fixjson" },
			rust = { "rustfmt" },
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		vim.cmd("autocmd FileType rust setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab")
	end,
}
