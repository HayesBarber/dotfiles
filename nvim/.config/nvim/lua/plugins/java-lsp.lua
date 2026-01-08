return {
	"nvim-java/nvim-java",
	cond = function()
		return false
	end,
	config = function()
		require("java").setup()
		vim.lsp.enable("jdtls")
	end,
}
