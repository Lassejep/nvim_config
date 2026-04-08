vim.pack.add({
  { src = "https://github.com/echasnovski/mini.nvim" },
  { src = "https://github.com/Aasim-A/scrollEOF.nvim" },
  { src = "https://github.com/folke/todo-comments.nvim" },
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
  { src = "https://github.com/selimacerbas/markdown-preview.nvim" },
  { src = "https://github.com/selimacerbas/live-server.nvim" },
})

require("mini.basics").setup()
require("mini.keymap").setup()
require("mini.ai").setup({ n_lines = 500 })
require("mini.diff").setup()
require("mini.comment").setup()
require("mini.icons").setup()
require("mini.move").setup({
  mappings = { left = "H", right = "L", up = "K", down = "J" },
})

require("scrollEOF").setup()
require("todo-comments").setup()
require("ibl").setup()

require("markdown_preview").setup({
  port = 8421,
  open_browser = true,
  debounce_ms = 300,
})

vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<cr>", { desc = "Markdown [P]review" })
