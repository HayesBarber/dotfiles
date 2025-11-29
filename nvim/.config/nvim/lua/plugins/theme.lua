return {
    "navarasu/onedark.nvim",
    priority = 1000,
    cond = function()
        return not vim.g.vscode
    end,
    config = function()
        require('onedark').setup {
            style = 'warmer'
        }
        require('onedark').load()
    end
}
