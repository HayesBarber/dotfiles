vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.o.termguicolors = true
vim.diagnostic.config({
	signs = true,
	virtual_text = true,
	update_in_insert = false,
})
vim.cmd("colorscheme slate")
