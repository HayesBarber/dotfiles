return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    cond = function()
        return not vim.g.vscode
    end,
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {}
    end,
}
