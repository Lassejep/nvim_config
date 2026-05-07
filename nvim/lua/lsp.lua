vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/williamboman/mason.nvim" },
  { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/j-hui/fidget.nvim" },
  { src = "https://github.com/mfussenegger/nvim-lint" },
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("*") },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = { "clangd", "lua_ls", "pylsp" } })
require("mason-tool-installer").setup({
  ensure_installed = { "stylua", "clang-format", "black", "isort", "prettier", "mypy", "tree-sitter-cli" },
})

require("conform").setup({
  notify_on_error = true,
  formatters_by_ft = {
    python = { "isort", "black" },
    lua = { "stylua" },
    cpp = { "clang-format" },
  },
  default_format_opts = { lsp_format = "fallback" },
  format_on_save = { timeout_ms = 500, async = false },
})

require("fidget").setup({
  notification = { override_vim_notify = true },
})

local lint = require("lint")
lint.linters_by_ft = { python = { "mypy" } }
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})

require("blink.cmp").setup({
  keymap = {
    preset = "default",
    ["<C-k>"] = {}, -- Stops digraph mode from being overwritten
  },
  appearance = { nerd_font_variant = "mono" },
  completion = { documentation = { auto_show = true, auto_show_delay_ms = 200 } },
  signature = { enabled = true },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})

require("nvim-treesitter").setup()
require("nvim-treesitter").install({ "yaml", "html", "python", "lua", "cpp", "c", "markdown", "latex" })

vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "LSP: [G]oto [D]efinition" })
vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "LSP: [G]oto [R]eferences" })
vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", { desc = "LSP: [G]oto [I]mplementations" })
vim.keymap.set("n", "<leader>D", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "LSP: Type [D]efinition" })
vim.keymap.set("n", "<leader>s", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "LSP: Document [S]ymbols" })
vim.keymap.set(
  "n",
  "<leader>ws",
  "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
  { desc = "LSP: [W]orkspace [S]ymbols" }
)
vim.keymap.set("n", "<leader>wd", "<cmd>Telescope diagnostics<cr>", { desc = "LSP: [W]orkspace [D]iagnostics" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame" })
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { desc = "LSP: code [A]ction" })
vim.keymap.set("n", "K", function()
  vim.lsp.buf.hover({ border = "rounded", max_height = 25, max_width = 120 })
end, { desc = "LSP: Hover Documentation" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "LSP: Show [D]iagnostic error messages" })
vim.keymap.set("n", "<leader>th", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "LSP: [T]oggle Inlay [H]ints" })

vim.keymap.set("n", "<leader>l", function()
  lint.try_lint()
end, { desc = "Trigger [L]inter" })

vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ async = true })
end, { desc = "[F]ormat buffer" })
