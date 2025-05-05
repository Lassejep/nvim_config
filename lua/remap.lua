vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show [D]iagnostic error messages" })

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
-- paste from system clipboard
vim.keymap.set({ "n", "v" }, "y", [["+y]])
vim.keymap.set("n", "Y", [["+Y]])

-- never press Q
vim.keymap.set("n", "Q", "<nop>")
