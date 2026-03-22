-- See https://github.com/stelcodes/bunny.yazi

local function shellexpand(path)
	local home = os.getenv("HOME")
	return path:gsub("^~", home)
end

-- Load backmarks from gtk-3
local function readBookmarks()
	local bookmarks = {}
	local filename = shellexpand("~/.config/gtk-3.0/bookmarks")
	local file = io.open(filename, "rb")
	if not file then
		return bookmarks
	end
	local data = file:read("*a")
	file:close()
	local keys = {}
	for v, k in string.gmatch(data, "file://([%w%a%p]+) ([^\n]+)\n") do
		local key = string.sub(k, 1, 1)
		local path = string.gsub(v, "\\%20", " ")
		if not keys[key] then
			-- print("k", key, k, path)
			keys[key] = true
			table.insert(bookmarks, {
				key = key,
				path = path,
			})
			-- All bookmarks need to have a key, unfortunately they can't be provided just as a path
			-- else
			-- table.insert(bookmarks, {
			-- 	path = v,
			-- })
		end
	end
	return bookmarks
end

-- readBookmarks()

require("bunny"):setup({
	hops = readBookmarks(),
	desc_strategy = "path", -- If desc isn't present, use "path" or "filename", default is "path"
	ephemeral = true, -- Enable ephemeral hops, default is true
	tabs = true, -- Enable tab hops, default is true
	notify = false, -- Notify after hopping, default is false
	fuzzy_cmd = "fzf", -- Fuzzy searching command, default is "fzf"
})
