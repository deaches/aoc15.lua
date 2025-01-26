function table:cycle()
   local i = 1

   return function()
      local c = self[i]
      i = (i % #self) + 1
      return c
   end
end
