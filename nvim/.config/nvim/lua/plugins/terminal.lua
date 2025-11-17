return {
    "akinsho/toggleterm.nvim",
    version = "*",
    cond = function()
        return not vim.g.vscode
    end,
    config = function()
        require("toggleterm").setup({
            direction = "float",
            open_mapping = [[<leader>t]],
        })
        vim.keymap.set('t', '<Esc>', function()
            vim.api.nvim_feedkeys(
                vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true),
                "n",
                false
            )
            vim.cmd("ToggleTerm")
        end, { noremap = true, silent = true })
    end,
}
