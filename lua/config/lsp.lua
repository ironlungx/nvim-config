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
