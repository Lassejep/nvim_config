return {
	-- Collection of smaller QOL plugins.
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.basics").setup()
		require("mini.keymap").setup()
		require("mini.ai").setup({ n_lines = 500 })
		require("mini.diff").setup()
		require("mini.comment").setup()
		require("mini.icons").setup()
		require("mini.move").setup({
			mappings = { left = "H", right = "L", up = "K", down = "J" },
		})
	end,
}
