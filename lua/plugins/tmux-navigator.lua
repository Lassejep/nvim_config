return {
	-- Tmux navigation
	"christoomey/vim-tmux-navigator",
	keys = {
		{ "<C-h>", "TmuxNavigateLeft<cr>", desc = "Tmux Navigate [L]eft" },
		{ "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Tmux Navigate [D]own" },
		{ "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Tmux Navigate [U]p" },
		{ "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Tmux Navigate [R]ight" },
	},
}
