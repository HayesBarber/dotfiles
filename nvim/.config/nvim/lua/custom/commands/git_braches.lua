local M = {}

function M.setup()
	vim.api.nvim_create_user_command("Branches", function()
		require("telescope.builtin").git_branches()
	end, {})
end

return M
