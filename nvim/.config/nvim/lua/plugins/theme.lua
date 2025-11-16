return {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false,
    priority = 1000,
    config = function()
        vim.o.termguicolors = true
        vim.cmd('colorscheme github_dark_tritanopia')
    end,
}
