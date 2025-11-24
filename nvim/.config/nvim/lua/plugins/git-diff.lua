return {
    "sindrets/diffview.nvim",
    cond = function()
        return not vim.g.vscode
    end,
    keys = {
        { "<leader>gd", "<cmd>DiffviewOpen<cr>",  desc = "Diffview Open" },
        { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
    },
}
