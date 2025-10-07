return {
    {
        'vscode-neovim/vscode-multi-cursor.nvim',
        cond = function()
            return vim.g.vscode
        end,
        opts = {},
        config = function()
            local cursors = require('vscode-multi-cursor')
            vim.keymap.set('n', '<cs-l>', function()
                cursors.selectHighlights()
            end)
        end,
    },
}
