vim.pack.add({
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
})

require("lualine").setup({
  sections = {
    lualine_c = { { "filename", path = 1 } },
  },
})

require("catppuccin").setup({
  flavor = "mocha",
  transparent_background = true,
})
vim.cmd.colorscheme("catppuccin-nvim")

require("render-markdown").setup({
  file_types = { "markdown", "codecompanion" },
})
