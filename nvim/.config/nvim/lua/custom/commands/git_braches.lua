local M = {}

function M.pick_branch()
	local telescope = require("telescope.builtin")
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	telescope.git_branches({
		attach_mappings = function(prompt_bufnr, map)
			map("i", "<CR>", function()
				local entry = action_state.get_selected_entry()
				local branch = entry.value

				actions.close(prompt_bufnr)

				local exists = vim.fn.systemlist("git branch --list " .. branch)
				if #exists > 0 then
					vim.cmd("!git checkout " .. branch)
				else
					vim.cmd("!git checkout -b " .. branch .. " origin/" .. branch)
				end
			end)

			return true
		end,
	})
end

function M.setup()
	vim.api.nvim_create_user_command("GitBranch", function()
		require("custom.commands.git_braches").pick_branch()
	end, {})
end

return M
