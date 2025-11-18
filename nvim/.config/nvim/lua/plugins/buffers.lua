return {
    'akinsho/bufferline.nvim',
    version = "*",
    cond = function()
        return not vim.g.vscode
    end,
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {},
}

