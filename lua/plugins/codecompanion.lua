return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim",
	},

	opts = function()
		return {
			extensions = {
				vectorcode = { opts = { add_tool = true } },
			},
			display = { diff = { enabled = false } },
			strategies = {
				inline = {
					adapter = "deepseek",
					keymaps = {
						accept_change = { modes = { n = "<leader>cy" }, description = "Accept the suggested change" },
						reject_change = { modes = { n = "<leader>cn" }, description = "Reject the suggested change" },
					},
				},

				chat = {
					selection_strategy = "telescope",
					adapter = "deepseek",
					show_token_count = true,
					slash_commands = require("plugins.ai.commands"),
					keymaps = {
						close = { modes = { n = "q", i = "<C-c>" } },
						stop = { modes = { n = "<leader>cs", i = "<C-s>" } },
						regenerate = { modes = { n = "<leader>cr", i = "<C-r>" } },
						codeblock = { modes = { n = "<leader>ci", i = "<C-i>" } },
						debug = { modes = { n = "<leader>cd", i = "<C-d>" } },
						yank_code = { modes = { n = "<leader>cy", i = "<C-y>" } },
						clear = { modes = { n = "<leader>cx", i = "<C-x>" } },
					},
				},
			},
		}
	end,

	keys = {
		{ "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "[C]odeCompanion[C]hat" },
		{ "<leader>ca", "<cmd>CodeCompanionActions<cr>", desc = "[C]odeCompanion[A]ctions" },
	},
}
