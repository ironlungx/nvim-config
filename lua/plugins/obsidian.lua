return {
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*", -- use latest release, remove to use latest commit
		---@module 'obsidian'
		---@type obsidian.config
		opts = {
			legacy_commands = false,
			workspaces = {
				{
					name = "notes",
					path = "~/notes/",
				},
			},
			note_id_func = function(title)
				if title ~= nil then
					return title
				end
				return tostring(os.time())
			end,
			templates = {
				folder = "templates",
				date_format = "%d-%m-%Y",
				time_format = "%H:%M",
			},
		},

		config = function(_, opts)
			local obsidian = require("obsidian")
			local level = vim.opt.conceallevel

			local group = vim.api.nvim_create_augroup("ObsidianUiToggleSimple", { clear = true })

			vim.api.nvim_create_autocmd("InsertEnter", {
				group = group,
				callback = function()
					level = vim.opt.conceallevel
					vim.opt.conceallevel = 0
				end,
			})

			vim.api.nvim_create_autocmd("InsertLeave", {
				group = group,
				callback = function()
					vim.opt.conceallevel = level
				end,
			})
		end,
	},

	-- {
	-- 	"jbyuki/nabla.nvim",
	-- 	lazy = true,
	--
	-- 	keys = function()
	-- 		return {
	-- 			{
	-- 				"<leader>P",
	-- 				':lua require("nabla").popup()<cr>',
	-- 				desc = "NablaPopUp",
	-- 			},
	-- 		}
	-- 	end,
	-- },
}
