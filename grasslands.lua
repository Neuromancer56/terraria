---------------------------------------------
-------------MAPGENS
---------------------------------------------

minetest.register_decoration({
    name = "terraria:grassland_tree_1",
    deco_type = "schematic",
    place_on = {"default:dirt_with_grass"},
    place_offset_y = 1,
    sidelen = 16,
    fill_ratio = 0.001465,
    biomes = {"grassland"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/grasssland_tree_1.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:grassland_bush_1",
    deco_type = "schematic",
    place_on = {"default:dirt_with_grass"},
    place_offset_y = 1,
    sidelen = 16,
    fill_ratio = 0.015365,
    biomes = {"grassland"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/grasssland_bush_1.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:grassland_bush_2",
    deco_type = "schematic",
    place_on = {"default:dirt_with_grass"},
    place_offset_y = -5,
    sidelen = 16,
    fill_ratio = 0.015365,
    biomes = {"grassland"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/grasssland_bush_2.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:boulder1",
    deco_type = "schematic",
    place_on = {"default:dirt_with_grass"},
    place_offset_y = -2,
    sidelen = 16,
    fill_ratio = 0.0015565,
    biomes = {"grassland"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/boulder_1.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:boulder2",
    deco_type = "schematic",
    place_on = {"default:dirt_with_grass"},
    place_offset_y = -2,
    sidelen = 16,
    fill_ratio = 0.0015565,
    biomes = {"grassland"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/boulder_2.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:aspen_tree_g",
    deco_type = "schematic",
    place_on = {"default:dirt_with_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.002265,
    biomes = {"dorwinion"},
    y_max = 31000,
    y_min = 1,
    schematic = minetest.get_modpath("default").."/schematics/aspen_tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})



minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	fill_ratio = 0.2,
	biomes = {"grassland"},
	decoration = {
		"default:grass_5", "default:grass_4",
	}
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	fill_ratio = 0.05,
	biomes = {"grassland"},
	decoration = {
		"flowers:rose", "flowers:dandelion_white",
		"flowers:tulip", "flowers:chrysanthemum_green",
		"flowers:viola", "flowers:dandelion_yellow",
		"flowers:geranium", "flowers:mushroom_brown",
	}
})


