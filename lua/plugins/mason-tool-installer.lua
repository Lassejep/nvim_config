return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "williamboman/mason.nvim" },
  opts = { ensure_installed = { "stylua", "clang-format", "black", "isort", "prettier", "mypy" } },
}
