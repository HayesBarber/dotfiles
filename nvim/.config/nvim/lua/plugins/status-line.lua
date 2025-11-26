return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cond = function()
        return not vim.g.vscode
    end,
    opts = {
        options = { theme = "powerline", disabled_filetypes = { "NvimTree", "toggleterm" } },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = {
                require("gitblame").get_current_blame_text,
            },
            lualine_x = { "progress", "filetype" },
            lualine_y = { "location" },
            lualine_z = { "lsp_status" },
        },
        tabline = {
            lualine_a = {},
            lualine_b = {
                {
                    'filename',
                    file_status = true,
                    path = 1,
                }
            },
            lualine_c = {},
            lualine_x = {
                "filesize",
            },
            lualine_y = {},
            lualine_z = {},
        }
    },
}
