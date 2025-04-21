require("remap")
require("set")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "plugins.vim-sleuth" },
	{ import = "plugins.comment" },
	{ import = "plugins.gitsigns" },
	{ import = "plugins.telescope" },
	{ import = "plugins.lspconfig" },
	{ import = "plugins.conform" },
	{ import = "plugins.cmp" },
	{ import = "plugins.todo-comments" },
	{ import = "plugins.catppuccin" },
	{ import = "plugins.mini" },
	{ import = "plugins.treesitter" },
	{ import = "plugins.codecompanion" },
	{ import = "plugins.fugitive" },
	{ import = "plugins.harpoon" },
	{ import = "plugins.undotree" },
	{ import = "plugins.obsidian" },
	{ import = "plugins.tmux-navigator" },
	{ import = "plugins.scrollEOF" },
	{ import = "plugins.oil" },
	{ import = "plugins.markdown-preview" },
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			task = "📌",
		},
	},
})
