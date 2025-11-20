return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cond = function()
		return not vim.g.vscode
	end,
	opts = {
		options = { theme = "powerline" },
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff" },
			lualine_c = { "filename", "filesize" },
			lualine_x = { "encoding", "progress", "filetype" },
			lualine_y = { "location" },
			lualine_z = { "lsp_status" },
		},
	},
}
