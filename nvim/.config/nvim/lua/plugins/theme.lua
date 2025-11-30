return {
	"Mofiqul/vscode.nvim",
	priority = 1000,
	cond = function()
		return not vim.g.vscode
	end,
	config = function()
		require("vscode").setup({})
		vim.cmd.colorscheme("vscode")
	end,
}
