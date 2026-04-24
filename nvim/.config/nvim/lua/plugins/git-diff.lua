return {
	"sindrets/diffview.nvim",
	cond = function()
		return not vim.g.vscode
	end,
	keys = {
		{ "gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
		{ "gq", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
	},
}
