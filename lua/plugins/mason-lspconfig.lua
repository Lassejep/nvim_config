return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },

  opts = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local servers = {}

    return {
      automatic_installation = true,
      ensure_installed = { "lua_ls", "clangd", "pylsp" },
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
      },
    }
  end,
}
