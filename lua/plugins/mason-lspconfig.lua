return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
  opts = { ensure_installed = { "clangd", "lua_ls", "pylsp" } },

  keys = {
    { "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "LSP: [G]oto [D]efinition" } },
    { "gr", "<cmd>Telescope lsp_references<cr>", { desc = "LSP: [G]oto [R]eferences" } },
    { "gi", "<cmd>Telescope lsp_implementations<cr>", { desc = "LSP: [G]oto [I]mplementations" } },
    { "<leader>D", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "LSP: Type [D]efinition" } },
    { "<leader>s", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "LSP: Document [S]ymbols" } },
    { "<leader>ws", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "LSP: [W]orkspace [S]ymbols" } },
    { "<leader>wd", "<cmd>Telescope diagnostics<cr>", { desc = "LSP: [W]orkspace [D]iagnostics" } },
    { "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame" } },
    { "<leader>a", vim.lsp.buf.code_action, { desc = "LSP: code [A]ction" } },
    { "<leader>K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation" } },
    { "<leader>d", vim.diagnostic.open_float, { desc = "LSP: Show [D]iagnostic error messages" } },
    {
      "<leader>th",
      function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end,
      { desc = "LSP: [T]oggle Inlay [H]ints" },
    },
  },
}
