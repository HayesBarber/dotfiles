return {
    "mason-org/mason-lspconfig.nvim",
    cond = function()
        return not vim.g.vscode
    end,
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
