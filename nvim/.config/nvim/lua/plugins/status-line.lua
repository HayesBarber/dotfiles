return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cond = function()
		return not vim.g.vscode
	end,
	opts = {
		options = { theme = "powerline", disabled_filetypes = { "NvimTree" } },
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff" },
			lualine_c = {
				"filename",
				"filesize",
				{ require("gitblame").get_current_blame_text, cond = require("gitblame").is_blame_text_available },
			},
			lualine_x = { "encoding", "progress", "filetype" },
			lualine_y = { "location" },
			lualine_z = { "lsp_status" },
		},
	},
}
