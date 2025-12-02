local sum = 0

local function is_invalid(n)
	local s = ("%d"):format(n)
	local l = #s

	for i=1,l do
		local times = math.floor(l / i)
		-- has to repeat at least twice
		-- change this to times == 2 to solve for part1 instead
		if times >= 2 then
			-- if the repeated pattern is the same as the original then it is invalid
			local pattern = s:sub(1,i)
			if s == string.rep(pattern, times) then
				return true
			end
		end
	end
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

print(sum) -- 43287141963
