return {
	-- Colorscheme plugin.
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = true,

	opts = {
		flavor = "mocha",
		transparent_background = true,
	},

	init = function()
		vim.cmd.colorscheme("catppuccin")
	end,
}
