local hooks = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
    vim.system({ "make" }, { cwd = ev.data.path }):wait()
  end
end
vim.api.nvim_create_autocmd("PackChanged", { callback = hooks })

vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim", version = "master" },
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
  { src = "https://github.com/stevearc/oil.nvim.git" },
  { src = "https://github.com/christoomey/vim-tmux-navigator" },
})

local ts = require("telescope")
ts.setup({
  extensions = { ["ui-select"] = { require("telescope.themes").get_dropdown() } },
})
ts.load_extension("fzf")
ts.load_extension("ui-select")

require("oil").setup({
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
})

vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<cr>", { desc = "Telescope [P]roject [F]iles" })
vim.keymap.set("n", "<leader>ps", "<cmd>Telescope live_grep<cr>", { desc = "Telescope [P]roject [S]earch" })
vim.keymap.set("n", "<leader>pb", "<cmd>Telescope buffers<cr>", { desc = "Telescope [P]roject [B]uffers" })

vim.keymap.set("", "<C-h>", "TmuxNavigateLeft<cr>", { desc = "Tmux Navigate [L]eft" })
vim.keymap.set("", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Tmux Navigate [D]own" })
vim.keymap.set("", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Tmux Navigate [U]p" })
vim.keymap.set("", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Tmux Navigate [R]ight" })
