return {
	-- AI integration
	"olimorris/codecompanion.nvim",
	config = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		strategies = {
			chat = {
				selection_strategy = "telescope",
				adapter = "deepseek",
				slash_commands = {
					["gitfiles"] = {
						description = "List git files",
						---@param chat CodeCompanion.Chat
						callback = function(chat)
							local handle = io.popen("git ls-files")
							if handle ~= nil then
								local result = handle:read("*a")
								handle:close()
								chat:add_reference({ role = "user", content = result }, "git", "<git_files>")
							else
								return vim.notify(
									"No git files available",
									vim.log.levels.INFO,
									{ title = "CodeCompanion" }
								)
							end
						end,
						opts = {
							contains_code = false,
						},
					},
				},
				keymaps = {
					close = {
						modes = { n = "q", i = "<C-c>" },
					},
				},
				show_token_count = true,
			},
		},
	},
	keys = { { "<leader>cc", vim.cmd.CodeCompanionChat, desc = "[C]odeCompanion[C]hat" } },
}
