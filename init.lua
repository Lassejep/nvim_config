vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- don't move cursor after join
vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor centered when jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep cursor centered when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- clear search highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- paste without overwriting vim paste register
vim.keymap.set("x", "p", [["+P]])

-- Copy to system clipboard
vim.keymap.set({ "n", "v" }, "y", [["+y]])
vim.keymap.set("n", "Y", [["+Y]])

vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.scrolloff = 10

require("lazy_init")
