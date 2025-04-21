return {
	-- Undo tree plugin
	"mbbill/undotree",
	keys = { { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle [U]ndo tree" } },
}
