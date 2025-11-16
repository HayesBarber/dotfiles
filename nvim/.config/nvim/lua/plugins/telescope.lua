return {
    {
        'nvim-telescope/telescope.nvim',
        tag = 'v0.1.9',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            if vim.g.vscode then
                return
            end
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>f', function()
                builtin.find_files({ hidden = true })
            end)
        end,
    },
}
