return {
  lua_ls = {
    settings = {
      Lua = {
        format = {
          enable = true,
          defaultConfig = {
            indent_style = "Spaces",
            indent_size = "2",
          },
          format = "stylua --indent-type Spaces --indent-width 2 -",
        },
        completion = { callSnippet = "Replace" },
      },
    },
  },
}
