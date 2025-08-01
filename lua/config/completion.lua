require("config.snippets")

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append("c")

local lspkind = require("lspkind")
lspkind.init({})

local kind_formatter = lspkind.cmp_format({
	mode = "symbol_text",
	menu = {
		buffer = "[buf]",
		nvim_lsp = "[LSP]",
		nvim_lua = "[api]",
		path = "[path]",
		luasnip = "[snip]",
		gh_issues = "[issues]",
	},
})

local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{
			name = "lazydev",
			-- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
			group_index = 0,
		},
		{ name = "path" },
		{ name = "buffer" },
		{ name = "nvim_lsp_signature_help" },
	},

	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-y>"] = cmp.mapping(
			cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			}),
			{ "i", "c" }
		),
		["<C-Space>"] = cmp.mapping.complete(),
	},

	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},

	formatting = {
		fields = { "abbr", "kind" },
		expandable_indicator = true,
		format = function(entry, vim_item)
			-- Lspkind setup for icons
			vim_item = kind_formatter(entry, vim_item)
			return vim_item
		end,
	},

	view = {
		entries = "custom",
	},

	sorting = {
		priority_weight = 2,
		comparators = {
			-- Below is the default comparitor list and order for nvim-cmp
			cmp.config.compare.recently_used,
			cmp.config.compare.kind,
			cmp.config.compare.offset,
			cmp.config.compare.scopes,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			cmp.config.compare.locality,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	window = {},
})
