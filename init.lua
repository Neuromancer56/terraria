local default_path = minetest.get_modpath("terraria")

if not minetest.get_modpath("variety") then
dofile(default_path.."/grasslands.lua")
dofile(default_path.."/temperate_coniferous_forest.lua")
dofile(default_path.."/mountain.lua")
end

dofile(default_path.."/temperate_forest.lua")
dofile(default_path.."/humid_coniferous_forest.lua")
dofile(default_path.."/humid_deciduous_forest.lua")
dofile(default_path.."/temperate_deciduous_forest.lua")
dofile(default_path.."/swamp.lua")



dofile(default_path.."/moreblocks.lua")
dofile(default_path.."/bonemeal.lua")
dofile(default_path.."/flowerpot.lua")




