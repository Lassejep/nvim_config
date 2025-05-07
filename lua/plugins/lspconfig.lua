local function toggle_inlay_hint()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

return {
  -- LSP plugin.
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "j-hui/fidget.nvim",
    "folke/lazydev.nvim",
  },
  lazy = false,

  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })
  end,

  keys = {
    { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "LSP: [G]oto [D]efinition" },
    { "gr", "<cmd>Telescope lsp_references<cr>", desc = "LSP: [G]oto [R]eferences" },
    { "gi", "<cmd>Telescope lsp_implementations<cr>", desc = "LSP: [G]oto [I]mplementations" },
    { "<leader>D", "<cmd>Telescope lsp_type_definitions<cr>", desc = "LSP: Type [D]efinition" },
    { "<leader>s", "<cmd>Telescope lsp_document_symbols<cr>", desc = "LSP: Document [S]ymbols" },
    { "<leader>ws", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "LSP: [W]orkspace [S]ymbols" },
    { "<leader>wd", "<cmd>Telescope diagnostics<cr>", desc = "LSP: [W]orkspace [D]iagnostics" },
    { "<leader>rn", vim.lsp.buf.rename, desc = "LSP: [R]e[n]ame" },
    { "<leader>a", vim.lsp.buf.code_action, desc = "LSP: code [A]ction" },
    { "<leader>K", vim.lsp.buf.hover, desc = "LSP: Hover Documentation" },
    { "<leader>d", vim.diagnostic.open_float, desc = "LSP: Show [D]iagnostic error messages" },
    { "<leader>th", toggle_inlay_hint, desc = "LSP: [T]oggle Inlay [H]ints" },
  },
}
