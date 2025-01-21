#!/usr/bin/env lua

neighborhood = {}
santa = {x = 0, y = 0}
unique = 0

instructions = io.read("a")
for i = 1, #instructions do
   -- I haven't found anything simple about using tables as keys,
   -- Can't say this is that original but I came up with the idea on my own
   -- to encode Santa's position as the key.
   -- Rather than write my own string shenanigans, we'll use the
   -- most overlooked string shenanigan in this version's stdlib: string.pack!
   local key = string.pack("jj", santa.x, santa.y)
   local count = neighborhood[key]
   local direction = string.byte(instructions, i)

   if count == nil then
      neighborhood[key] = 1 -- Your Xbox got stuck in the chimney, Jimothy.
      unique = unique + 1
   else
      neighborhood[key] = count + 1
   end

   if direction == 94 then      -- ^ (north)
      santa.y = santa.y + 1
   elseif direction == 62 then  -- > (east)
      santa.x = santa.x + 1
   elseif direction == 118 then -- v (south)
      santa.y = santa.y - 1
   elseif direction == 60 then  -- < (west)
      santa.x = santa.x - 1
   end
end

print(unique)
