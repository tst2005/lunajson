local pairs52 = pairs
do
	local x = setmetatable({}, {__pairs=function(_t)
		return function() return "ok" end
	end})
	local ok = pairs52(x)
	assert(type(ok)=="function")
	if ok({})~="ok" then
		function pairs52(t) -- lua5.2 and lua5.3 use mt.__pairs
			local mt = getmetatable(t)
			if mt and mt.__pairs then
				return mt.__pairs(t)
			end
			return next, t, nil
		end
	end
end
return pairs52
