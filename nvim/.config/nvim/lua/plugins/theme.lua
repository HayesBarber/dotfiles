return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    cond = function()
        return not vim.g.vscode
    end,
    config = function()
        require("gruvbox").setup({})
        vim.o.background = "dark"
        vim.cmd("colorscheme gruvbox")
    end,
}
