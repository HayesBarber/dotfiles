local vscode = require('vscode')

local map = vim.keymap.set

map('n', '<leader>e', function() vscode.action('workbench.view.explorer') end)
map('n', '<leader>j', function() vscode.action('workbench.action.previousEditor') end)
map('n', '<leader>k', function() vscode.action('workbench.action.nextEditor') end)
map('n', '<leader>]', function() vscode.action('workbench.action.moveEditorToNextGroup') end)
map('n', '<leader>[', function() vscode.action('workbench.action.moveEditorToPreviousGroup') end)
map('n', '<leader>h', function() vscode.action('workbench.action.focusLeftGroup') end)
map('n', '<leader>l', function() vscode.action('workbench.action.focusRightGroup') end)
map('n', '<leader>a', function() vscode.action('workbench.action.closeEditorsInGroup') end)
map('n', '<leader>gd', function() vscode.action('git.viewChanges') end)
map('n', '<leader>n', function() vscode.action('workbench.action.increaseViewSize') end)
map('n', '<leader>m', function() vscode.action('workbench.action.decreaseViewSize') end)
map('n', '<leader>cp', function() vscode.action('copyFilePath') end)
map('n', '<leader>cr', function() vscode.action('copyRelativeFilePath') end)
map('n', '<leader>rs', function() vscode.action('editor.action.rename') end)
map('n', '<leader>ca', function() vscode.action('editor.action.quickFix') end)
