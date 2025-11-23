return {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    cond = function()
        return not vim.g.vscode
    end,
    opts = {
        enabled = true,
        message_template = " <summary> • <date> • <author> • <<sha>>",
        date_format = "%m-%d-%Y",
        display_virtual_text = 0,
    },
}
