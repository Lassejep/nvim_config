return {
  -- Formatter plugin.
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },

  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    notify_on_error = true,
    formatters_by_ft = {
      python = { "isort", "black" },
      lua = { "stylua" },
      cpp = { "clang-format" },
    },
    default_format_opts = { lsp_format = "fallback" },
    format_on_save = { timeout_ms = 500, async = false },
  },

  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
}
