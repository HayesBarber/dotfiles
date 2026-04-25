local M = {}

function M.setup()
	require("custom.commands.non-tree-buffers").setup()
end

return M
