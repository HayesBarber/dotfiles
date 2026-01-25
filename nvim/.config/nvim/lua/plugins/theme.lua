return {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	cond = function()
		return not vim.g.vscode
	end,
	config = function()
		vim.cmd.colorscheme("kanagawa-dragon")
	end,
}
