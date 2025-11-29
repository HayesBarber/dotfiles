return {
    "nvim-telescope/telescope.nvim",
    tag = "v0.1.9",
    cond = function()
        return not vim.g.vscode
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>f", function()
            builtin.find_files({
                hidden = true,
                file_ignore_patterns = { ".git/" },
            })
        end)

        vim.keymap.set("n", "<leader>rg", function()
            builtin.live_grep({
                file_ignore_patterns = { ".git/" },
                additional_args = function()
                    return { "--hidden" }
                end,
            })
        end)

        vim.keymap.set("n", "<leader>b", function()
            builtin.buffers({
                sort_lastused = true,
                ignore_current_buffer = true,
            })
        end)

        vim.keymap.set("n", "<leader>d", function()
            builtin.diagnostics({
                initial_mode = "normal",
            })
        end)

        vim.keymap.set("n", "<leader>rr", function()
            builtin.lsp_references({
                initial_mode = "normal",
            })
        end)
    end,
}
