return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    cond = function()
        return not vim.g.vscode
    end,
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({})

        vim.keymap.set("n", "<leader>H", function()
            harpoon:list():add()
        end)
        vim.keymap.set("n", "<C-h>", function()
            harpoon:list():clear()
        end)

        for i = 1, 5 do
            vim.keymap.set("n", "<leader>" .. i, function()
                harpoon:list():select(i)
            end)
        end

        -- basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        vim.keymap.set("n", "<C-j>", function() toggle_telescope(harpoon:list()) end)
    end,
}

