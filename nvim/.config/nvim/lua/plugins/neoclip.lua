return {
    "AckslD/nvim-neoclip.lua",
    cond = function()
        return not vim.g.vscode
    end,
    dependencies = {
        { "kkharji/sqlite.lua",           module = "sqlite" },
        { "nvim-telescope/telescope.nvim" },
    },
    config = function()
        require("neoclip").setup({
            initial_mode = "normal",
            enable_persistent_history = true,
        })
    end,
    keys = {
        { "<leader>y", "<cmd>Telescope neoclip<cr>" },
        {
            "<leader>nc",
            function() require("neoclip").clear_history() end,
        },
    },
}
