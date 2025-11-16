return {
    {
        'nvim-telescope/telescope.nvim',
        tag = 'v0.1.9',
        cond = function()
            return not vim.g.vscode
        end,
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>f', function()
                builtin.find_files({ hidden = true })
            end)
        end,
    },
}
