local M = {}

function M.setup()
    if not vim.g.vscode then
        require("custom.commands.lsp-dart").setup()
    end
end

return M
