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
        require('neoclip').setup()
    end,
}
