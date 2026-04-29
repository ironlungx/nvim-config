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
					name = "epq",
					path = "~/repo/epq/vault/",
				},
			},
			note_id_func = function(title)
				if title ~= nil then
					return title
				end
				return tostring(os.time())
			end,
		},
	},

	{
		"jbyuki/nabla.nvim",
		lazy = true,

		keys = function()
			return {
				{
					"<leader>P",
					':lua require("nabla").popup()<cr>',
					desc = "NablaPopUp",
				},
			}
		end,
	},
}
