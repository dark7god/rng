-- Lua RNG
-- Copyright Nicolas "DarkGod" Casalini - 2014

local core = require 'rngcore'

local rng = {}

for k, e in pairs(core) do rng[k] = e end

-- Some more vital rng functions
function rng.mbonus(max, level, max_level)
	if level > max_level - 1 then level = max_level - 1 end

	local bonus = (max * level) / max_level
	local extra = (max * level) % max_level
	if rng.range(0, max_level - 1) < extra then bonus = bonus + 1 end

	local stand = max / 4
	extra = max % 4
	if rng.range(0, 3) < extra then stand = stand + 1 end

	local val = rng.normal(bonus, stand)
	if val < 0 then val = 0 end
	if val > max then val = max end

	return val
end

function rng.table(t)
	local id = rng.range(1, #t)
	return t[id], id
end

function rng.tableRemove(t)
	local id = rng.range(1, #t)
	return table.remove(t, id)
end

function rng.tableIndex(t, ignore)
	local rt = {}
	if not ignore then ignore = {} end
	for k, e in pairs(t) do if not ignore[k] then rt[#rt+1] = k end end
	return rng.table(rt)
end

rng.seed(0)

return rng