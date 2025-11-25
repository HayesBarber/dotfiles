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
    opts = {
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
        update_focused_file = {
            enable = true,
        },
        view = {
            adaptive_size = true,
        },
    },
    keys = {
        {
            "<leader>e",
            function()
                require("nvim-tree.api").tree.toggle({ focus = true })
            end,
            desc = "Toggle NvimTree",
        },
    },
}
