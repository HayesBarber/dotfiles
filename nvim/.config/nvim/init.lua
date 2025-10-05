vim.g.mapleader = ' '

vim.o.number = true
vim.o.relativenumber = true

vim.cmd('nmap <leader>w :w<cr>')
vim.cmd('nmap <leader>q :q<cr>')

if vim.g.vscode then
  local vscode = require('vscode')

  vim.keymap.set('n', '<leader>e', function()
    vscode.action('workbench.view.explorer')
  end, { desc = 'Focus VSCode Explorer' })

end
