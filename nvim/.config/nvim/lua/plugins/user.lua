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
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function() require("flash").jump() end,
        desc = "Flash",
      },
    },
  },

  {
    "akinsho/toggleterm.nvim",
    opts = function(_, opts)
      opts.direction = "horizontal"

      opts.size = function() return math.floor(vim.o.lines * 0.4) end

      return opts
    end,
  },
}
