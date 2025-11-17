return {
    "akinsho/toggleterm.nvim",
    version = "*",
    cond = function()
        return not vim.g.vscode
    end,
    config = function()
        require("toggleterm").setup({
            direction = "float",
            open_mapping = [[<C-j>]],
        })
    end,
}
