#!/usr/bin/env lua

require "strutils"

present = present or {}
present._mt = {
   __index = present,
}

function present.new(spec)
   local width, length, height = table.unpack(spec:split("x"))
   local gift = {
      width  = math.tointeger(width),
      length = math.tointeger(length),
      height = math.tointeger(height),
   }

   setmetatable(gift, present._mt)

   return gift -- Do you have your receipt?
end

-- Initially this was { min(w, l), min(l, h) }.
-- It worked for the examples and other data I tried but yet my sums
-- were wrong.  That's the WORST problem to have with an AoC task!
-- There's an edge case I was missing.
-- If the length is smaller than both width and height, this will
-- select the length both times.
function present:smallestsides()
   local ordered = {self.width, self.length, self.height}
   table.sort(ordered)
   return ordered
end

function present:slack()
   local smallest = self:smallestsides()
   return smallest[1] * smallest[2]
end

function present:paper()
   local lw, wh, lh =
      self.length * self.width,
      self.width  * self.height,
      self.length * self.height

   return 2 * (lw + wh + lh) + self:slack()
end

function present:volume()
   return self.length * self.width * self.height
end

function present:ribbon()
   local smallest = self:smallestsides()
   return 2 * (smallest[1] + smallest[2]) + self:volume()
end

paper  = 0
ribbon = 0

for line in io.lines() do
   local gift = present.new(line)

   paper = paper + gift:paper()
   ribbon = ribbon + gift:ribbon()
end

print(paper)
print(ribbon)
