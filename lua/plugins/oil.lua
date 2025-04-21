return {
	-- Better File Explorer
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = true,
		view_options = {
			show_hidden = true,
		},
		use_default_keymaps = false,
		keymaps = {
			["g?"] = "actions.show_help",
			["<CR>"] = "actions.select",
			["<C-p>"] = "actions.preview",
			["<C-c>"] = "actions.close",
			["<leader>r"] = "actions.refresh",
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
			["`"] = "actions.cd",
			["~"] = "actions.tcd",
			["gs"] = "actions.change_sort",
			["gx"] = "actions.open_external",
			["g."] = "actions.toggle_hidden",
			["g\\"] = "actions.toggle_trash",
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
