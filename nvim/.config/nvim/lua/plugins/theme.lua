return {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000,
	cond = function()
		return not vim.g.vscode
	end,
	config = function()
		vim.cmd.colorscheme("rose-pine")
	end,
}
