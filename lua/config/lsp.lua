vim.lsp.enable("nixd")
vim.lsp.config("nixd", {
	nixd = {
		nixpkgs = {
			expr = "import <nixpkgs> { }",
		},
		options = {
			nixos = {
				expr = '(builtins.getFlake "/home/ironlung/nix-config/").nixosConfigurations.valinor.options',
			},
			home_manager = {
				expr = '(builtins.getFlake "/home/ironlung/nix-config").homeConfigurations."ironlung@valinor".options',
			},
		},
	},
})

vim.lsp.enable("pylsp")
vim.lsp.config("pylsp", {
	settings = {
		pylsp = {
			plugins = {
				black = { enabled = true }, -- Formatter
				pylint = { enabled = true }, -- Linter
				pyflakes = { enabled = false },
				yapf = { enabled = false },
				autopep8 = { enabled = false },
				ruff = { enabled = true },
			},
		},
	},
})

vim.lsp.enable("ruff")
