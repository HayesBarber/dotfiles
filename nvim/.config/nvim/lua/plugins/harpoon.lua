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

		vim.keymap.set("n", "<C-h>", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<C-S-h>", function()
			harpoon:list():clear()
		end)

		for i = 1, 5 do
			vim.keymap.set("n", "<leader>" .. i, function()
				harpoon:list():select(i)
			end)
		end

		vim.keymap.set("n", "<leader>h", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
	end,
}
