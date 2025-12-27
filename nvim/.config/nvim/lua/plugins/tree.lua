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
                    quit_on_open = false,
                },
            },
            update_focused_file = {
                enable = true,
            },
            view = {
                adaptive_size = true,
            },
            git = {
                enable = true,
                ignore = false,
            },
        })
        vim.keymap.set("n", "<leader>e", function()
            require("nvim-tree.api").tree.toggle({ focus = true })
        end)
    end,
}
