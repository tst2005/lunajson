
local writeorder = require "writeorder"
local wpairs = writeorder.pairs or pairs

local json = require "lunajson"

local json_kstr = '{"a":"aa","c":"cc","b":"bb"}'

local r = json.decode(json_kstr, nil, nil, nil, writeorder.newtable)

for k,v in wpairs(r) do
	print(k,v)
end

local json_istr = '["11","22","33"]'
local r = json.decode(json_istr, nil, nil, nil, writeorder.newtable) -- writeorder.newtable not used here

for k,v in pairs(r) do
	print(k,v)
end

