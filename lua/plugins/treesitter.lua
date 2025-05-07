return {
  -- Treesitter plugin, for syntax highlighting.
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "bash", "c", "html", "lua", "luadoc", "markdown", "vim", "vimdoc", "markdown_inline" },
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.install").prefer_git = true
    require("nvim-treesitter.configs").setup(opts)
  end,
}
