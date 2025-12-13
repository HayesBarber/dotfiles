local function git_changed_files()
	if vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null"):match("true") == nil then
		return ""
	end

	local output = vim.fn.systemlist("git status --porcelain")
	local count = #output
	return ("Δ " .. count)
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cond = function()
		return not vim.g.vscode
	end,
	opts = {
		options = { theme = "powerline", disabled_filetypes = { "NvimTree", "toggleterm" } },
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", git_changed_files, "diagnostics" },
			lualine_c = {
				require("gitblame").get_current_blame_text,
			},
			lualine_x = { "progress", "filetype" },
			lualine_y = { "location" },
			lualine_z = { "lsp_status" },
		},
		tabline = {
			lualine_a = {
				"buffers",
			},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {
				"filesize",
			},
			lualine_y = {
				{
					"filename",
					file_status = true,
					path = 1,
				},
			},
			lualine_z = {},
		},
	},
}
