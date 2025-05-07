return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "williamboman/mason.nvim" },

  opts = function()
    return {
			ensure_installed = {
				"stylua",
				"clang-format",
				"black",
				"prettier",
				"mypy",
			},
    }
  end,
}
