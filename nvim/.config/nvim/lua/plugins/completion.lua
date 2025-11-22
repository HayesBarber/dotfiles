return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	cond = function()
		return not vim.g.vscode
	end,
	version = "1.*",
	opts = {
		keymap = { preset = "super-tab" },
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = { documentation = { auto_show = true } },
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},
		},
	},
	opts_extend = { "sources.default" },
}
