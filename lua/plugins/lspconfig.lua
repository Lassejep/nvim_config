local function get_lsp_keybinds(event)
	local map = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
	end
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
	if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
		map("<leader>th", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, "[T]oggle Inlay [H]ints")
	end
	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show [D]iagnostic error messages" })
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

	init = function()
		vim.diagnostic.config({ float = { border = "rounded" } })
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				get_lsp_keybinds(event)
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
	},
}
