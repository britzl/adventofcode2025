local dial = 50
local password = 0

local f = assert(io.open("input.txt", "r"))
local txt = f:read("*a")
for dir,amount in string.gmatch(txt, "([L|R])(%d*)\n") do
	dial = (dial + amount * (dir == "R" and 1 or -1)) % 100
	if dial == 0 then password = password + 1 end
end

print(password)