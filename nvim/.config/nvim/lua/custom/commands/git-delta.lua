local cache = {
	value = "",
	last_update = 0,
	is_running = false,
}

local TTL = 8

local function update_git_status()
	if cache.is_running then
		return
	end
	cache.is_running = true
	cache.value = "Δ .."

	vim.fn.jobstart("git status --porcelain", {
		stdout_buffered = true,
		on_stdout = function(_, data)
			local count = #data - 1
			cache.value = "Δ " .. count
		end,
		on_exit = function()
			cache.last_update = vim.uv.now() / 1000
			cache.is_running = false
		end,
	})
end

local function git_delta()
	local now = vim.uv.now() / 1000

	if (now - cache.last_update) > TTL then
		update_git_status()
	end

	return cache.value
end

return git_delta
