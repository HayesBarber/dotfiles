return {
    "akinsho/toggleterm.nvim",
    version = "*",
    cond = function()
        return not vim.g.vscode
    end,
    config = function()
        require("toggleterm").setup({
            direction = "vertical",
            size = function()
                return math.floor(vim.o.columns * 0.5)
            end,
            open_mapping = [[<C-j>]],
        })

        vim.api.nvim_create_autocmd("TermOpen", {
            pattern = "term://*toggleterm#*",
            callback = function()
                vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { buffer = true })
            end,
        })
    end,
}
