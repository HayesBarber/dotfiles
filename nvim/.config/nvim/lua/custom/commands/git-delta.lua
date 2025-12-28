local cache = {
    value = "",
    last = 0,
}

local TTL = 10

local function git_delta()
    local now = vim.uv.now() / 1000

    if now - cache.last < TTL then
        return cache.value
    end

    cache.last = now
    if vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null"):match("true") == nil then
        cache.value = ""
    else
        local output = vim.fn.systemlist("git status --porcelain")
        local count = #output
        cache.value = ("Δ " .. count)
    end

    return cache.value
end

return git_delta
