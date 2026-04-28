---@type table<string, vim.lsp.Config>
local servers = {
	clangd = {
		cmd = {
			"clangd",
			"--background-index",
		},
	},

	typst = {
		cmd = { "tinymist" },
		filetypes = { "typst" },
		settings = {},
	},

	nixd = {
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
	},

	pylsp = {
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
	},

	stylua = {}, -- Used to format Lua code

	-- Special Lua Config, as recommended by neovim help docs
	lua_ls = {
		on_init = function(client)
			if client.workspace_folders then
				local path = client.workspace_folders[1].name
				if
					path ~= vim.fn.stdpath("config")
					and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
				then
					return
				end
			end

			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
				runtime = {
					version = "LuaJIT",
					path = { "lua/?.lua", "lua/?/init.lua" },
				},
				workspace = {
					checkThirdParty = false,
					-- NOTE: this is a lot slower and will cause issues when working on your own configuration.
					--  See https://github.com/neovim/nvim-lspconfig/issues/3189
					library = vim.tbl_extend("force", vim.api.nvim_get_runtime_file("", true), {
						"${3rd}/luv/library",
						"${3rd}/busted/library",
					}),
				},
			})
		end,
		settings = {
			Lua = {},
		},
	},
}

local function read_file(path)
	local f = io.open(path, "r")
	if not f then
		return nil
	end
	local content = f:read("*a")
	f:close()
	return content
end

local has_pio = vim.fn.findfile("platformio.ini", ".;") ~= ""
local has_toolchain = vim.fn.findfile("pio_toolchain", ".;") ~= ""
local toolchain = has_toolchain
		and "--query-driver=" .. read_file(vim.fn.findfile("pio_toolchain", ".;")):gsub("\r?\n$", "")
	or ""

if has_pio and has_toolchain then
	servers["clangd"] = {
		cmd = {
			"clangd",
			-- '--background-index',
			toolchain,
		},
	}
end

for name, server in pairs(servers) do
	vim.lsp.config(name, server)
	vim.lsp.enable(name)
end
