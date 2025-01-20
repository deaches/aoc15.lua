#!/usr/bin/env lua

floor = 0
instructions = io.read("a")

for i = 1, #instructions do
   ch = string.byte(instructions, i)

   if ch == 40 then     -- (
      floor = floor + 1
   elseif ch == 41 then -- )
      floor = floor - 1
   end
end

print(floor)
