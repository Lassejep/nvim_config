return {
	-- Collection of smaller QOL plugins.
	"echasnovski/mini.nvim",
	config = function()
		require("mini.ai").setup({ n_lines = 500 })
		require("mini.diff").setup()
		require("mini.comment").setup()
	end,
}
