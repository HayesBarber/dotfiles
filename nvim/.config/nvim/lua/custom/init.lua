local M = {}

function M.setup()
	require("custom.commands.git-branches").setup()
end

return M
