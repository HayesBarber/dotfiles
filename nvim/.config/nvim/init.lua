vim.g.mapleader = ' '

vim.o.number = true
vim.o.relativenumber = true
vim.opt.clipboard = "unnamedplus"

vim.cmd('nmap <leader>w :w<cr>')
vim.cmd('nmap <leader>q :q<cr>')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('n', '<leader>j', ':bnext<CR>', { desc = "Next buffer" })
vim.keymap.set('n', '<leader>k', ':bprevious<CR>', { desc = "Previous buffer" })
vim.diagnostic.config({
  signs = true,
  virtual_text = true,
  update_in_insert = false,
})

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
    { import = "plugins" },
  },
  install = {},
  checker = { enabled = true },
})
