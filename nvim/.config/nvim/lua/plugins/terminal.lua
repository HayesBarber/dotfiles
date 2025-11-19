return {
    "akinsho/toggleterm.nvim",
    version = "*",
    cond = function()
        return not vim.g.vscode
    end,
    opts = {
        direction = "float",
        open_mapping = [[<C-j>]],
    },
}
