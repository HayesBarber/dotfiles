return {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",
	cond = function()
		return not vim.g.vscode
	end,
	config = function()
		local mc = require("multicursor-nvim")
		mc.setup()
		local set = vim.keymap.set
		set({ "n", "x" }, "<up>", function()
			mc.lineAddCursor(-1)
		end)
		set({ "n", "x" }, "<down>", function()
			mc.lineAddCursor(1)
		end)
		set({ "n", "x" }, "<leader>A", mc.matchAllAddCursors)
		mc.addKeymapLayer(function(layerSet)
			layerSet("n", "<esc>", function()
				mc.clearCursors()
			end)
		end)
	end,
}
