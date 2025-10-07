vim.g.mapleader = ' '

vim.o.number = true
vim.o.relativenumber = true

vim.cmd('nmap <leader>w :w<cr>')
vim.cmd('nmap <leader>q :q<cr>')

if vim.g.vscode then
  require('keymaps.vscode')
end

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    {
      'vscode-neovim/vscode-multi-cursor.nvim',
      event = 'VeryLazy',
      cond = function()
        return vim.g.vscode
      end,
      opts = {},
      config = function()
        local cursors = require('vscode-multi-cursor')

        vim.keymap.set('n', '<cs-l>', function()
          cursors.selectHighlights()
        end)
      end
    },
    { 'folke/flash.nvim', },
  },
  install = {},
  checker = { enabled = true },
})
