function string:split(sep)
   local pattern = string.format("([^%s]+)", sep)
   local matcher = string.gmatch(self, pattern)
   local parts = {}

   for match in matcher do
      table.insert(parts, match)
   end

   return parts
end
