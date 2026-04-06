return {
	"nvim-java/nvim-java",
	cond = function()
		return not vim.g.vscode and _G.LOCAL.enable_java
	end,
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		require("java").setup()
		vim.lsp.enable("jdtls")
	end,
}
