return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".git", ".luarc.json" },
  settings = {
    Lua = {
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "Spaces",
          indent_size = "2",
        },
      },
      completion = { callSnippet = "Replace" },
    },
  },
}
