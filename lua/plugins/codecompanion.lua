local function get_slash_commands()
	return {
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
					return vim.notify("No git files available", vim.log.levels.INFO, { title = "CodeCompanion" })
				end
			end,
			opts = { contains_code = false },
		},
	}
end

local function get_chat_keymaps()
	return {
		close = { modes = { n = "q", i = "<C-c>" } },
		stop = { modes = { n = "<leader>cs", i = "<C-s>" } },
		regenerate = { modes = { n = "<leader>cr", i = "<C-r>" } },
		codeblock = { modes = { n = "<leader>ci", i = "<C-i>" } },
		debug = { modes = { n = "<leader>cd", i = "<C-d>" } },
		yank_code = { modes = { n = "<leader>cy", i = "<C-y>" } },
	}
end

local function get_chat_tools()
	return {
		vectorcode = {
			description = "Run VectorCode to retrieve the project context",
			callback = require("vectorcode.integrations").codecompanion.chat.make_tool({}),
		},
	}
end

local function get_chat_config()
	return {
		selection_strategy = "telescope",
		adapter = "deepseek",
		show_token_count = true,
		tools = get_chat_tools(),
		slash_commands = get_slash_commands(),
		keymaps = get_chat_keymaps(),
	}
end

local function get_inline_config()
	return {
		adapter = "deepseek",
	}
end

return {
	"olimorris/codecompanion.nvim",
	config = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim",
	},
	opts = function()
		return {
			strategies = {
				inline = get_inline_config(),
				chat = get_chat_config(),
			},
		}
	end,
	keys = {
		{ "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "[C]odeCompanion[C]hat" },
		{ "<leader>ca", "<cmd>CodeCompanionActions<cr>", desc = "[C]odeCompanion[A]ctions" },
	},
}
