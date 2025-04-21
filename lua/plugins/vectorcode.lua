return {
	"Davidyz/VectorCode",
	version = "*", -- optional, depending on whether you're on nightly or release
	build = "pipx upgrade vectorcode",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "VectorCode", -- if you're lazy-loading VectorCode
}
