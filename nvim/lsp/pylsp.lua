return {
  cmd = { "python-lsp-server" },
  filetypes = { "python" },
  settings = {
    pylsp = {
      plugins = {
        black = { enabled = true, executable = "black" },
        mypy = { enabled = true },
        pycodestyle = { enabled = false },
        autopep8 = { enabled = true, maxLineLength = 88 },
        isort = { enabled = true, profile = "black" },
        flake8 = { enabled = true, maxLineLength = 88, ignore = { "E203", "E701", "W503" } },
      },
    },
  },
}
