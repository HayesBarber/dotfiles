return {
	"folke/lazydev.nvim",
	cond = function()
		return not vim.g.vscode
	end,
	ft = "lua",
	opts = {
		library = {
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	},
}
