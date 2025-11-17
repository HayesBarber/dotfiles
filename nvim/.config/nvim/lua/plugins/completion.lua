return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    cond = function()
        return not vim.g.vscode
    end,
    version = '1.*',
    opts = {
        keymap = { preset = 'super-tab' },
        appearance = {
            nerd_font_variant = 'mono'
        },
        completion = { documentation = { auto_show = true } },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
}
