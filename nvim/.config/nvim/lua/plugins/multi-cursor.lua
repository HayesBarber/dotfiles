return {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",
	cond = function()
		return not vim.g.vscode
	end,
}
