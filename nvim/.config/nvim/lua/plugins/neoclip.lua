return {
    "AckslD/nvim-neoclip.lua",
    cond = function()
        return not vim.g.vscode
    end,
    dependencies = {
        { 'kkharji/sqlite.lua',           module = 'sqlite' },
        { 'nvim-telescope/telescope.nvim' },
    },
    config = function()
        require('neoclip').setup({
            enable_persistent_history = true,
        })
    end,
    keys = {
        { "<leader>y", "<cmd>Telescope neoclip<cr>" },
    },
}
