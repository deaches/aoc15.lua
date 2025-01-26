#!/usr/bin/env lua

require "tableau"

claus = {}

function claus.new()
   return setmetatable({x = 0, y = 0}, {__index = claus})
end

function claus:north() self.y = self.y + 1 end
function claus:south() self.y = self.y - 1 end
function claus:east()  self.x = self.x + 1 end
function claus:west()  self.x = self.x - 1 end

instructions = io.read("a")

function part1()
   local unique = 0
   local neighborhood = {}
   local santa = claus.new()

   for i = 1, #instructions do
      local key = string.pack("jj", santa.x, santa.y)
      local count = neighborhood[key]
      local direction = string.byte(instructions, i)

      if count == nil then
         neighborhood[key] = 1
         unique = unique + 1
      else
         neighborhood[key] = count + 1
      end

      if     direction == 94  then santa:north()
      elseif direction == 62  then santa:east()
      elseif direction == 118 then santa:south()
      elseif direction == 60  then santa:west()
      end
   end

   return unique
end


function part2()
   local unique = 0
   local neighborhood = {}
   local nextclaus = table.cycle({claus.new(), claus.new()})

   for i = 1, #instructions do
      local sleigh = nextclaus()

      local key = string.pack("jj", sleigh.x, sleigh.y)
      local count = neighborhood[key]
      local direction = string.byte(instructions, i)

      if count == nil then
         neighborhood[key] = 1
         unique = unique + 1
      else
         neighborhood[key] = count + 1
      end

      if     direction == 94  then sleigh:north()
      elseif direction == 62  then sleigh:east()
      elseif direction == 118 then sleigh:south()
      elseif direction == 60  then sleigh:west()
      end
   end

   return unique + 1 -- To account for Robo-Claus also dropping one at (0, 0).
end

print(part1())
print(part2())
