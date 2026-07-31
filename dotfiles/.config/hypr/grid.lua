local state = {
	order = {},
}

local function target_id(target)
	local window = target.window
	return window and tostring(window.stable_id) or tostring(target.index)
end

local function active_id(ctx)
	for _, target in ipairs(ctx.targets) do
		local window = target.window
		if window and window.active then
			return target_id(target)
		end
	end
	return state.order[#state.order]
end

local function index_of(tbl, value)
	for i, v in ipairs(tbl) do
		if v == value then
			return i
		end
	end
end

local function sync_order(ctx)
	local present = {}
	local targets = {}

	for _, target in ipairs(ctx.targets) do
		local id = target_id(target)
		present[id] = true
		targets[id] = target
	end

	local old_order = state.order
	state.order = {}

	for _, id in ipairs(old_order) do
		if present[id] then
			table.insert(state.order, id)
		end
	end

	local focused = active_id(ctx)
	for _, target in ipairs(ctx.targets) do
		local id = target_id(target)
		if not index_of(state.order, id) then
			local after = focused and index_of(state.order, focused)
			table.insert(state.order, after and (after + 1) or (#state.order + 1), id)
		end
	end

	return targets
end

local function cycle_focus(ctx, delta)
	local id = active_id(ctx)
	local i = id and index_of(state.order, id)

	if not i or #state.order == 0 then
		return
	end

	local j = i + delta
	if j > #state.order then
		j = 1
	elseif j < 1 then
		j = #state.order
	end

	local next_id = state.order[j]
	local targets = sync_order(ctx)
	local target = targets[next_id]

	if target and target.window then
		-- Focus the target window using the layout API
		target.window:focus()
	end
end

hl.layout.register("grid", {
	recalculate = function(ctx)
		local targets = sync_order(ctx)
		local n = #state.order
		if n == 0 then
			return
		end

		local cols = math.ceil(math.sqrt(n))

		for i, id in ipairs(state.order) do
			local target = targets[id]
			if target then
				target:place(ctx:grid_cell(i, cols))
			end
		end
	end,

	layout_msg = function(ctx, msg)
		local command = msg:match("^(%S+)")

		if command == "cyclenext" then
			cycle_focus(ctx, 1)
		elseif command == "cycleprev" then
			cycle_focus(ctx, -1)
		else
			return "grid: expected cyclenext or cycleprev"
		end

		return true
	end,
})
