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
        require("nvim-tree").setup({
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
        })
        vim.keymap.set('n', '<leader>e', function()
            require("nvim-tree.api").tree.toggle({ focus = true })
        end)
    end,
}
