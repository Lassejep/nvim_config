return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "mini.icons" },
  opts = function()
    return {
      sections = {
        lualine_c = { { "filename", path = 1 } },
      },
    }
  end,
}
