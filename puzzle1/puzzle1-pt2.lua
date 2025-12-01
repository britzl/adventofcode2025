local dial = 50
local password = 0

local f = assert(io.open("input.txt", "r"))
local txt = f:read("*a")
for dir,amount in string.gmatch(txt, "([L|R])(%d*)\n") do
	-- increase by one for every full rotation
	password = password + math.floor(amount / 100)
	-- also doing a partial rotation?
	if amount % 100 > 0 then
		local newdial = (dial + amount * (dir == "R" and 1 or -1)) % 100
		-- increase by one if stopping at 0
		-- or rotating past 0 (but ignore if starting at 0)
		if (newdial == 0)
		or (dir == "L" and newdial > dial and dial > 0)
		or (dir == "R" and newdial < dial and dial > 0) then
			password = password + 1
		end
		dial = newdial
	end
end

print(password)