local on_attach = function(client, bufnr) end
local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({})

lspconfig.clangd.setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	on_attach = on_attach,
	cmd = {
		"clangd",
		"--background-index",
		"-j=12",
	},
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "ino" },
})

lspconfig.nixd.setup({
	cmd = { "nixd" },
	settings = {
		nixd = {
			nixpkgs = {
				expr = "import <nixpkgs> { }",
			},
			options = {
				nixos = {
					expr = '(builtins.getFlake "~/nix-config/").nixosConfigurations.valinor.options',
				},
				home_manager = {
					expr = '(builtins.getFlake "~/nix-config").homeConfigurations."ironlung@valinor".options',
				},
			},
		},
	},
})

lspconfig.basedpyright.setup({
	settings = {
		basedpyright = {
			diagnosticSeverityOverrides = {
				reportUnknownMemberType = "none",
				reportUninitializedInstanceVariable = "none",
			},
		},
	},
})

lspconfig.ruff.setup({})
lspconfig.ts_ls.setup({})

vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })

vim.keymap.set("n", "<leader>ca", "<cmd> lua vim.lsp.buf.code_action() <cr>", { desc = "Code Actions" })
vim.keymap.set("n", "<leader>fm", "<cmd> lua require('conform').format()  <cr>", { desc = "Format" })
vim.keymap.set("n", "<leader>rs", "<cmd> lua vim.lsp.buf.rename() <cr>", { desc = "Rename Symbol" })
vim.keymap.set("n", "gd", "<cmd> lua vim.lsp.buf.definition() <cr>", { desc = "Goto Definition" })
vim.keymap.set("n", "gI", "<cmd> lua vim.lsp.buf.implementation() <cr>", { desc = "Goto Implementation" })
vim.keymap.set("n", "K", "<cmd> lua vim.lsp.buf.hover() <cr>", { desc = "Hover" })
