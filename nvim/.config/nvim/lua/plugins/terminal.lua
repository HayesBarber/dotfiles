return {
	"akinsho/toggleterm.nvim",
	version = "*",
	cond = function()
		return not vim.g.vscode
	end,
	config = function()
		require("toggleterm").setup({
			direction = "vertical",
			size = vim.o.columns * 0.4,
			open_mapping = [[<C-j>]],
		})
	end,
}
