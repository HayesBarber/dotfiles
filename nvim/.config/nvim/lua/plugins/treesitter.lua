return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = { "python", "json", "bash", },
            highlight = { enable = true },
            indent = { enable = true },
        })
	vim.treesitter.language.register("bash", "zsh")
    end,
}
