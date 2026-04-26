---@type LazySpec
return {

  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      },
    },
  },

  {
    "akinsho/toggleterm.nvim",
    opts = function(_, opts)
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*toggleterm#*",
        callback = function()
				  vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { buffer = true })
			  end,
      })

      return opts
    end,
  },

	 {
	  "folke/flash.nvim",
	  event = "VeryLazy",
	  opts = {},
	  keys = {
		  {
			  "s",
			  mode = { "n", "x", "o" },
			  function()
				  require("flash").jump()
			  end,
			  desc = "Flash",
		  },
	},},

}
