local vscode = require('vscode')

local map = vim.keymap.set

map('n', '<leader>e', function() vscode.action('workbench.view.explorer') end, { desc = 'Focus VSCode Explorer' })
map('n', '<leader>j', function() vscode.action('workbench.action.previousEditor') end, { desc = 'Previous tab' })
map('n', '<leader>k', function() vscode.action('workbench.action.nextEditor') end, { desc = 'Next tab' })
map('n', '<leader>]', function() vscode.action('workbench.action.moveEditorToNextGroup') end,
    { desc = 'Move editor to next group' })
map('n', '<leader>[', function() vscode.action('workbench.action.moveEditorToPreviousGroup') end,
    { desc = 'Move editor to previous group' })
map('n', '<leader>h', function() vscode.action('workbench.action.focusLeftGroup') end, { desc = 'Focus Left Group' })
map('n', '<leader>l', function() vscode.action('workbench.action.focusRightGroup') end, { desc = 'Focus Right Group' })
map('n', '<leader>a', function() vscode.action('workbench.action.closeEditorsInGroup') end,
    { desc = 'Close Editors In Group' })
map('n', '<leader>gd', function() vscode.action('git.viewChanges') end, { desc = 'Git - View Changes' })
map('n', '<leader>n', function() vscode.action('workbench.action.increaseViewSize') end, { desc = 'Increase View Size' })
map('n', '<leader>m', function() vscode.action('workbench.action.decreaseViewSize') end, { desc = 'Decrease View Size' })
map('n', '<leader>cp', function() vscode.action('copyFilePath') end, { desc = 'Copy File Path' })
map('n', '<leader>cr', function() vscode.action('copyRelativeFilePath') end, { desc = 'Copy Relative File Path' })
map('n', '<leader>rs', function() vscode.action('editor.action.rename') end, { desc = 'Rename Symbol' })
map('n', '<leader>ca', function() vscode.action('editor.action.quickFix') end, { desc = 'Quick Fix' })
