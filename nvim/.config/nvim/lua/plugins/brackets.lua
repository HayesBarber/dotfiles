return {
	"m4xshen/autoclose.nvim",
	cond = function()
		return not vim.g.vscode
	end,
	opts = {},
}
