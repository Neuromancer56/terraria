	-- Deciduous forest

	minetest.register_biome({
		name = "humid_deciduous_forest",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 1,
		heat_point = 63,
		humidity_point = 73,
	})

	minetest.register_biome({
		name = "humid_deciduous_forest_shore",
		node_top = "default:dirt",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 0,
		y_min = -1,
		heat_point = 63,
		humidity_point = 73,
	})

	minetest.register_biome({
		name = "humid_deciduous_forest_ocean",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_cave_liquid = "default:water_source",
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = -2,
		y_min = -255,
		heat_point = 63,
		humidity_point = 73,
	})

	minetest.register_biome({
		name = "humid_deciduous_forest_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 63,
		humidity_point = 73,
	})


minetest.register_decoration({
	deco_type = "simple",
			place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	fill_ratio = 0.075,
	biomes = {"humid_deciduous_forest"},
	decoration = {
		"default:fern_3", "default:fern_4",
		"default:fern_5",
	}
})
minetest.register_decoration({
	deco_type = "simple",
			place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	fill_ratio = 0.075,
	biomes = {"humid_deciduous_forest"},
	decoration = {
		"default:junglegrass",
	}
})

minetest.register_decoration({
	deco_type = "simple",
			place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	fill_ratio = 0.03,
	biomes = {"humid_deciduous_forest"},
	decoration = {
		"flowers:mushroom_brown", "flowers:mushroom_red",
	}
})

minetest.register_decoration({
	deco_type = "simple",
			place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	fill_ratio = 0.15,
	biomes = {"humid_deciduous_forest"},
	decoration = {
		"default:grass_2", "default:grass_4",
		"default:grass_5",
	}
})

minetest.register_decoration({
    name = "terraria:apple_tree_2",
    deco_type = "schematic",
			place_on = {"default:dirt_with_grass"},
    place_offset_y = -1,
    sidelen = 16,
    fill_ratio = 0.00565,
    biomes = {"humid_deciduous_forest"},
    y_max = 31000,
    y_min = 0,
    schematic = minetest.get_modpath("terraria").."/schematics/apple_tree_2.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:apple_tree_3",
    deco_type = "schematic",
			place_on = {"default:dirt_with_grass"},
    place_offset_y = -1,
    sidelen = 16,
    fill_ratio = 0.00565,
    biomes = {"humid_deciduous_forest"},
    y_max = 31000,
    y_min = 0,
    schematic = minetest.get_modpath("terraria").."/schematics/apple_tree_3.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:apple_tree_4",
    deco_type = "schematic",
			place_on = {"default:dirt_with_grass"},
    place_offset_y = -1,
    sidelen = 16,
    fill_ratio = 0.00565,
    biomes = {"humid_deciduous_forest"},
    y_max = 31000,
    y_min = 0,
    schematic = minetest.get_modpath("terraria").."/schematics/apple_tree_4.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:boulder_6",
    deco_type = "schematic",
			place_on = {"default:dirt_with_grass"},
    place_offset_y = -1,
    sidelen = 16,
    fill_ratio = 0.00365,
    biomes = {"humid_deciduous_forest"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/boulder_2.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

if minetest.get_mapgen_setting("mg_name") == "v6" then
default.register_leafdecay({
	trunks = {"default:tree", "default:aspen_tree"},
	leaves = {"default:leaves", "default:aspen_leaves", "default:bush_stem"},
	radius = 3,
})
end

default.register_leafdecay({
	trunks = {"default:tree", "default:aspen_tree"},
	leaves = {"default:leaves", "default:aspen_leaves", "default:bush_stem"},
	radius = 3,
})
