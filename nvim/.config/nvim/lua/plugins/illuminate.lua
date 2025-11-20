return {
	"RRethy/vim-illuminate",
	cond = function()
		return not vim.g.vscode
	end,
}
