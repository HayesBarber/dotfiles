local M = {}

function M.setup()
    vim.lsp.config.dartls = {
        cmd = { "dart", "language-server", "--protocol=lsp" },
        filetypes = { "dart" },
        root_dir = vim.fs.root(0, { "pubspec.yaml", ".git" }),
    }

    vim.lsp.enable("dartls")
end

return M
