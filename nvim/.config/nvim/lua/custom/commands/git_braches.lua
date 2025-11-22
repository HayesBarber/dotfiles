local M = {}

function M.pick_branch()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	pickers
		.new({}, {
			prompt_title = "Git Branches",
			finder = finders.new_oneshot_job({ "git", "branch" }, {}),
			sorter = conf.generic_sorter({}),
			initial_mode = "normal",
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local entry = action_state.get_selected_entry()
					if not entry or not entry.value then
						return
					end
					local branch = entry.value
					if branch:sub(1, 2) == "* " then
						branch = branch:sub(3)
					end
					branch = vim.trim(branch)
					print(branch)
				end)
				return true
			end,
		})
		:find()
end

function M.setup()
	vim.api.nvim_create_user_command("GitBranch", function()
		require("custom.commands.git_braches").pick_branch()
	end, {})
end

return M
