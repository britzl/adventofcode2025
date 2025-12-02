local sum = 0

local function is_invalid(n)
	local s = ("%d"):format(n)
	local l = #s
	-- an uneven length will not be a valid pattern
	if l % 2 == 1 then return false end
	-- is the left and right part of the number matching?
	local left = s:sub(1,(l/2))
	local right = s:sub(1+l/2,l)
	return left == right
end

local f = assert(io.open("input.txt", "r"))
local txt = f:read("*a")
for range in string.gmatch(txt, "[^,]+") do
	local from, to = string.match(range, "(%d*)-(%d*)")
	for n=from,to do
		if is_invalid(n) then
			sum = sum + n
		end
	end
end

print(sum) -- 34826702005