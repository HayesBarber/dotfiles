return {
	"stevearc/conform.nvim",
	cond = function()
		return not vim.g.vscode
	end,
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
		},
		format_on_save = {
			timeout_ms = 3000,
			lsp_format = "fallback",
		},
	},
}
