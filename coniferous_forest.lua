local S = minetest.get_translator("terraria")
---------------------------------------------
-------------MAPGENS
---------------------------------------------

minetest.register_decoration({
    name = "terraria:pine_tree_1",
    deco_type = "schematic",
    place_on = {"default:dirt_with_coniferous_litter"},
    place_offset_y = 1,
    sidelen = 16,
    fill_ratio = 0.00565,
    biomes = {"coniferous_forest"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/pine_tree_1.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:pine_tree_2",
    deco_type = "schematic",
    place_on = {"default:dirt_with_coniferous_litter"},
    place_offset_y = 1,
    sidelen = 16,
    fill_ratio = 0.00565,
    biomes = {"coniferous_forest"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/pine_tree_2.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:pine_tree_3",
    deco_type = "schematic",
    place_on = {"default:dirt_with_coniferous_litter"},
    place_offset_y = 1,
    sidelen = 16,
    fill_ratio = 0.00565,
    biomes = {"coniferous_forest"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/pine_tree_3.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:pine_tree_4",
    deco_type = "schematic",
    place_on = {"default:dirt_with_coniferous_litter"},
    place_offset_y = 1,
    sidelen = 16,
    fill_ratio = 0.00565,
    biomes = {"coniferous_forest"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/pine_tree_4.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

	minetest.register_biome({
		name = "temperate_coniferous_forest",
		node_top = "terraria:temperate_coniferous_forest_dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 6,
		heat_point = 42,
		humidity_point = 65,
	})



minetest.register_decoration({
    name = "terraria:pine_tree_1_1",
    deco_type = "schematic",
			place_on = {"terraria:temperate_coniferous_forest_dirt_with_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.01165,
    biomes = {"temperate_coniferous_forest"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/pine_tree_1.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:pine_tree_2_2",
    deco_type = "schematic",
			place_on = {"terraria:temperate_coniferous_forest_dirt_with_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.01165,
    biomes = {"temperate_coniferous_forest"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/pine_tree_2.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:pine_tree_3_3",
    deco_type = "schematic",
	place_on = {"terraria:temperate_coniferous_forest_dirt_with_grass"}, 
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.01165,
    biomes = {"temperate_coniferous_forest"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/pine_tree_3.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:pine_tree_4_4",
    deco_type = "schematic",
			place_on = {"terraria:temperate_coniferous_forest_dirt_with_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.01165,
    biomes = {"temperate_coniferous_forest"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/pine_tree_4.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})




minetest.register_decoration({
	deco_type = "simple",
			place_on = {"terraria:temperate_coniferous_forest_dirt_with_grass"},
	sidelen = 16,
	fill_ratio = 0.4,
	biomes = {"temperate_coniferous_forest"},
	decoration = {
		"default:fern_1", "default:fern_3",
		"default:fern_2", "default:fern_4",
		"default:fern_5",
	}
})

minetest.register_decoration({
	deco_type = "simple",
			place_on = {"terraria:temperate_coniferous_forest_dirt_with_grass"},
	sidelen = 16,
	fill_ratio = 0.1,
	biomes = {"temperate_coniferous_forest"},
	decoration = {
		"flowers:mushroom_brown", "flowers:mushroom_red",
	}
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"terraria:dirt_with_coniferous_grass"},
	sidelen = 16,
	fill_ratio = 0.3,
	biomes = {"temperate_coniferous_forest"},
	decoration = {
		"terraria:spruce_leaves_on_the_ground",
	}
})


minetest.register_decoration({
	deco_type = "simple",
			place_on = {"terraria:temperate_coniferous_forest_dirt_with_grass"},
	sidelen = 16,
	fill_ratio = 0.15,
	biomes = {"temperate_coniferous_forest"},
	decoration = {
		"default:grass_1", "default:grass_3",
		"default:grass_2", "default:grass_4",
		"default:grass_5",
	}
})

minetest.register_decoration({
    name = "terraria:pine_tree_5_5",
    deco_type = "schematic",
			place_on = {"terraria:temperate_coniferous_forest_dirt_with_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.00265,
    biomes = {"temperate_coniferous_forest"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("default").."/schematics/pine_tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:pine_tree_6_6",
    deco_type = "schematic",
			place_on = {"terraria:temperate_coniferous_forest_dirt_with_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.00265,
    biomes = {"temperate_coniferous_forest"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("default").."/schematics/small_pine_tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

	minetest.register_decoration({
		name = "default:pine_log_c3",
		deco_type = "schematic",
		place_on = {"default:dirt_with_snow", "terraria:temperate_coniferous_forest_dirt_with_grass"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0018,
    biomes = {"temperate_coniferous_forest"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("default") .. "/schematics/pine_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"default:dirt_with_snow", "terraria:temperate_coniferous_forest_dirt_with_grass"},
		num_spawn_by = 8,
	})

minetest.register_decoration({
    name = "terraria:pine_tree_8_8",
    deco_type = "schematic",
			place_on = {"terraria:temperate_coniferous_forest_dirt_with_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.01165,
    biomes = {"temperate_coniferous_forest"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/pine_tree_8.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:pine_tree_9_9",
    deco_type = "schematic",
			place_on = {"terraria:temperate_coniferous_forest_dirt_with_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.01165,
    biomes = {"temperate_coniferous_forest"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/pine_tree_9.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:boulder_5",
    deco_type = "schematic",
			place_on = {"terraria:temperate_coniferous_forest_dirt_with_grass"},
    place_offset_y = -1,
    sidelen = 16,
    fill_ratio = 0.00465,
    biomes = {"temperate_coniferous_forest"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/boulder_2.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

---------------------------------------------
-------------BLOCKS
---------------------------------------------
minetest.register_node("terraria:temperate_coniferous_forest_dirt_with_grass", {
	description = S("Dirt With Grass And Coniferous Litter"),
	tiles = {"terraria_temperate_coniferous_forest_grass.png", "default_dirt.png",
		{name = "default_dirt.png^terraria_temperate_coniferous_forest_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})
