return {
	-- Note taking plugin
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		workspaces = { { name = "notes", path = "~/ws/notes" } },
		daily_notes = {
			folder = "daily",
			date_format = "%y-%m-%d",
			alias_format = "%y-%m-%d",
			template = "daily.md",
		},
		templates = {
			subdir = "templates",
			date_format = "%y-%m-%d",
			time_format = "%h:%m",
			substitutions = {},
		},
		completion = { complete = true, min_chars = 2 },
		picker = { name = "telescope.nvim", mappings = { new = "<C-x>", insert_link = "<C-l>" } },
		ui = { enable = false },
		open_notes_in = "current",
		attachments = {
			img_folder = "screenshots",
			---@param client obsidian.Client
			---@param path obsidian.Path the absolute path to the image file
			---@return string
			img_text_func = function(client, path)
				path = client:vault_relative_path(path) or path
				return string.format("![%s](%s)", path.name, path)
			end,
		},
		---@param title string|?
		---@return string
		note_id_func = function(title)
			local name = ""
			if title ~= nil then
				name = title:gsub(" ", "_"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				name = tostring(os.time())
			end
			return name
		end,

		---@return string
		image_name_func = function()
			return tostring(os.date("%Y-%m-%d-%H-%M-%S"))
		end,
	},
	keys = {
		{ "<leader>oo", vim.cmd.ObsidianOpen, desc = "Obsidian [O]pen" },
		{ "<leader>on", vim.cmd.ObsidianNew, desc = "Obsidian [N]ew" },
		{ "<leader>og", vim.cmd.ObsidianFollowLink, desc = "Obsidian [G]o to link" },
		{
			"<leader>ol",
			function()
				vim.cmd([[normal! viwo]])
				vim.cmd.ObsidianLink()
			end,
			desc = "Obsidian [L]ink",
		},
		{
			"<leader>oln",
			function()
				vim.cmd([[normal! viwo]])
				vim.cmd.ObsidianLinkNew()
			end,
			desc = "Obsidian [L]ink [N]ew",
		},
		{ "<leader>of", vim.cmd.ObsidianQuickSwitch, desc = "Obsidian [Q]uick [S]witch" },
		{ "<leader>os", vim.cmd.ObsidianSearch, desc = "Obsidian [S]earch" },
		{ "<leader>or", vim.cmd.ObsidianRename, desc = "Obsidian [R]ename" },
		{ "<leader>op", vim.cmd.ObsidianPasteImg, desc = "Obsidian [P]aste Image" },
		{ "<leader>od", vim.cmd.ObsidianToday, desc = "Obsidian [D]aily note" },
		{ "<leader>ot", vim.cmd.ObsidianTemplate, desc = "Obsidian [T]emplate" },
	},
}
