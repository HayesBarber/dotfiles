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

  vim.keymap.set('n', '<leader>j', function()
    vscode.action('workbench.action.previousEditor')
  end, { desc = 'Previous tab' })

  vim.keymap.set('n', '<leader>k', function()
    vscode.action('workbench.action.nextEditor')
  end, { desc = 'Next tab' })

  vim.keymap.set('n', '<leader>]', function()
    vscode.action('workbench.action.moveEditorToNextGroup')
  end, { desc = 'Move editor to next group' })

  vim.keymap.set('n', '<leader>[', function()
    vscode.action('workbench.action.moveEditorToPreviousGroup')
  end, { desc = 'Move editor to previous group' })

  vim.keymap.set('n', '<leader>h', function()
    vscode.action('workbench.action.focusLeftGroup')
  end, { desc = 'Focus Left Group' })

  vim.keymap.set('n', '<leader>l', function()
    vscode.action('workbench.action.focusRightGroup')
  end, { desc = 'Focus Right Group' })

  vim.keymap.set('n', '<leader>a', function()
    vscode.action('workbench.action.closeEditorsInGroup')
  end, { desc = 'Close Editors In Group' })

  vim.keymap.set('n', '<leader>gd', function()
    vscode.action('git.viewChanges')
  end, { desc = 'Git - View Changes' })

  vim.keymap.set('n', 'n', function()
    vscode.action('workbench.action.increaseViewSize')
  end, { desc = 'Increase View Size' })

  vim.keymap.set('n', 'm', function()
    vscode.action('workbench.action.decreaseViewSize')
  end, { desc = 'Decrease View Size' })

  vim.keymap.set('n', '<leader>cp', function()
    vscode.action('copyFilePath')
  end, { desc = 'Copy File Path' })

  vim.keymap.set('n', '<leader>cr', function()
    vscode.action('copyRelativeFilePath')
  end, { desc = 'Copy Relative File Path' })

  vim.keymap.set('n', '<leader>rs', function()
    vscode.action('editor.action.rename')
  end, { desc = 'Rename Symbol' })

  vim.keymap.set('n', '<leader>ca', function()
    vscode.action('editor.action.quickFix')
  end, { desc = 'Quick Fix' })
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
