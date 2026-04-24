local M = {}

function M.setup()
	require("custom.commands.lsp-dart").setup()
	require("custom.commands.non-tree-buffers").setup()
end

return M
