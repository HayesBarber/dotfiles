return {
	"akinsho/toggleterm.nvim",
	version = "*",
	cond = function()
		return not vim.g.vscode
	end,
	opts = {
		direction = "vertical",
		size = vim.o.columns * 0.4,
		open_mapping = [[<C-j>]],
	},
}
