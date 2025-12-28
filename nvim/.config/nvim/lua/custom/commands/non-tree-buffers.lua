local M = {}

function M.get_non_tree_buffers()
    local bufs = {}
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buftype ~= "nofile" then
            local name = vim.api.nvim_buf_get_name(buf)
            if not name:match("NvimTree_") then
                table.insert(bufs, buf)
            end
        end
    end
    return bufs
end

function M.setup()
    vim.api.nvim_create_user_command("BufClose", function()
        local non_tree_bufs = M.get_non_tree_buffers()

        if #non_tree_bufs <= 1 then
            vim.cmd("bd")
        else
            vim.cmd("bprevious")
            vim.cmd("bd #")
        end
    end, {})
    vim.keymap.set("n", "<leader>q", ":BufClose<CR>", { desc = "Close buffer" })
end

return M
