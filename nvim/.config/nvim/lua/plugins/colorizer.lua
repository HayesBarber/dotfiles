return {
	"brenoprata10/nvim-highlight-colors",
	cond = function()
		return not vim.g.vscode
	end,
	config = function()
		require("nvim-highlight-colors").setup({})
	end,
}
