
-- http://lua-users.org/wiki/OrderedTable


local function newtable()
	local nextkey, firstkey = {}, {}
	nextkey[nextkey] = firstkey
 
	local function onext(self, key)
		while key ~= nil do
			key = nextkey[key]
			local val = self[key]
			if val ~= nil then return key, val end
		end
	end
 
	local mt = {}
 
	function mt:__newindex(key, val)
print("DEBUG: writeorder.newtable: rawset", key, val)
		rawset(self, key, val)
		if nextkey[key] == nil then
			nextkey[nextkey[nextkey]] = key
			nextkey[nextkey] = key
		end
	end
 
	function mt:__pairs() return onext, self, firstkey end
 
	return setmetatable({}, mt)
end

local function pairs52(t, ...)
	return ( (getmetatable(t) or {}).__pairs or pairs)(t, ...)
end

return {newtable=newtable, pairs=pairs52}
