local function kvpairs(t)
	local i = -1
	return function ()
		i = i+2
		if t[i] then
			return t[i], t[i+1]
		end
	end
end
return kvpairs
