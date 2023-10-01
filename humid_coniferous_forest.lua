local S = minetest.get_translator("terraria")
-----------------------------------------------
---------------spruce Tree---------------------
-----------------------------------------------
minetest.register_node("terraria:spruce_tree", {
	description = S("Spruce Tree"),
	tiles = {"terraria_spruce_tree_top.png", "terraria_spruce_tree_top.png",
		"terraria_spruce_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("terraria:spruce_wood", {
	description = S("Spruce Wood Planks"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"terraria_spruce_wood.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

default.register_fence("terraria:fence_spruce_wood", {
	description = S("Spruce Wood Fence"),
	texture = "terraria_fence_spruce_wood.png",
	inventory_image = "default_fence_overlay.png^terraria_spruce_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^terraria_spruce_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = "terraria:spruce_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence_rail("terraria:fence_rail_spruce_wood", {
	description = S("Spruce Wood Fence Rail"),
	texture = "terraria_fence_rail_spruce_wood.png",
	inventory_image = "default_fence_rail_overlay.png^terraria_spruce_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^terraria_spruce_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = "terraria:spruce_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})

default.register_mesepost("terraria:mese_post_light_spruce_wood", {
	description = S("Spruce Wood Mese Post Light"),
	texture = "terraria_fence_spruce_wood.png",
	material = "terraria:spruce_wood",
})

minetest.register_node("terraria:spruce_leaves", {
	description = S("Spruce Tree Leaves"),
	drawtype = "allfaces_optional",
	tiles = {"terraria_spruce_leaves.png"},
	special_tiles = {"terraria_spruce_leaves_simple.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"terraria:spruce_sapling"}, rarity = 20},
			{items = {"terraria:spruce_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = after_place_leaves,
})

minetest.register_node("terraria:spruce_sapling", {
	description = S("Spruce Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"terraria_spruce_sapling.png"},
	inventory_image = "terraria_spruce_sapling.png",
	wield_image = "terraria_spruce_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_new_spruce_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"terraria:spruce_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 7, z = 4},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

local function grow_new_spruce_sapling(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-2, y = pos.y, z = pos.z-3}, minetest.get_modpath("terraria") .. "/schematics/spruce_tree_3.mts", "0", nil, false)
end

if minetest.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"terraria:spruce_sapling", grow_new_spruce_sapling, "soil"},
	})
end

if minetest.get_modpath("doors") then
doors.register_fencegate("terraria:gate_spruce_wood", {
	description = S("Spruce Wood Fence Gate"),
	texture = "terraria_spruce_wood.png",
	material = "terraria:spruce_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})
end

if minetest.get_modpath("stairs") then
	stairs.register_stair_and_slab("spruce_wood", "terraria:spruce_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"terraria_spruce_wood.png"},
		S("Spruce Wood Stair"),
		S("Spruce Wood Slab"),
		default.node_sound_wood_defaults())
end

minetest.register_craft({
	type = "fuel",
	recipe = "terraria:spruce_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "terraria:fence_spruce_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "terraria:fence_rail_spruce_wood",
	burntime = 4,
})

minetest.register_craft({
	output = "terraria:spruce_wood 4",
	recipe = {
		{"terraria:spruce_tree"},
	}
})

if minetest.get_mapgen_setting("mg_name") == "v6" then
	default.register_leafdecay({
		trunks = {"terraria:spruce_tree"},
		leaves = {"terraria:spruce_leaves"},
		radius = 3,
	})
end

default.register_leafdecay({
	trunks = {"terraria:spruce_tree"},
	leaves = {"terraria:spruce_leaves"},
	radius = 3,
})

minetest.register_node("terraria:dirt_with_coniferous_grass", {
	description = S("Dirt with Coniferous Grass"),
	tiles = {"terraria_coniferous_grass.png", "default_dirt.png",
		{name = "default_dirt.png^terraria_coniferous_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("terraria:spruce_leaves_on_the_ground", {
	description = S("Spruce Leaves On The Ground"),
	drawtype = "signlike",
	waving = 1,
	tiles = {"spruce_leaves_on_the_ground.png"},
	inventory_image = "spruce_leaves_on_the_ground.png",
	wield_image = "spruce_leaves_on_the_ground.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, attached_node = 1, oddly_breakable_by_hand=3, 
flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type="wallmounted",
		wall_top = {-0.5, 0.49, -0.5, 0.5, 0.5, 0.5},
		wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.49, 0.5},
		wall_side = {-0.5, -0.5, -0.5, -0.49, 0.5, 0.5},
	},
})

	-- Coniferous forest

	minetest.register_biome({
		name = "humid_coniferous_forest",
		node_top = "terraria:dirt_with_coniferous_grass",
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
		heat_point = 30,
		humidity_point = 85,
	})

	minetest.register_biome({
		name = "humid_coniferous_forest_dunes",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = 5,
		y_min = 4,
		heat_point = 30,
		humidity_point = 85,
	})

	minetest.register_biome({
		name = "humid_coniferous_forest_ocean",
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
		y_max = 3,
		y_min = -255,
		heat_point = 30,
		humidity_point = 85,
	})

	minetest.register_biome({
		name = "humid_coniferous_forest_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 30,
		humidity_point = 85,
	})

minetest.register_decoration({
    name = "terraria:boulder_3",
    deco_type = "schematic",
    place_on = {"terraria:dirt_with_coniferous_grass"},
    place_offset_y = -2,
    sidelen = 16,
    fill_ratio = 0.0015565,
    biomes = {"humid_coniferous_forest"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/boulder_1.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:boulder_4",
    deco_type = "schematic",
    place_on = {"terraria:dirt_with_coniferous_grass"},
    place_offset_y = -2,
    sidelen = 16,
    fill_ratio = 0.0015565,
    biomes = {"humid_coniferous_forest"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/boulder_2.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:spruce_tree_1",
    deco_type = "schematic",
    place_on = {"terraria:dirt_with_coniferous_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.008365,
    biomes = {"humid_coniferous_forest"},
    y_max = 31000,
    y_min = 1,
    schematic = minetest.get_modpath("terraria").."/schematics/spruce_tree_1.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:spruce_tree_2",
    deco_type = "schematic",
    place_on = {"terraria:dirt_with_coniferous_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.008365,
    biomes = {"humid_coniferous_forest"},
    y_max = 31000,
    y_min = 1,
    schematic = minetest.get_modpath("terraria").."/schematics/spruce_tree_2.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:spruce_tree_3",
    deco_type = "schematic",
    place_on = {"terraria:dirt_with_coniferous_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.008365,
    biomes = {"humid_coniferous_forest"},
    y_max = 31000,
    y_min = 1,
    schematic = minetest.get_modpath("terraria").."/schematics/spruce_tree_3.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:spruce_tree_4",
    deco_type = "schematic",
    place_on = {"terraria:dirt_with_coniferous_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.008365,
    biomes = {"humid_coniferous_forest"},
    y_max = 31000,
    y_min = 1,
    schematic = minetest.get_modpath("terraria").."/schematics/spruce_tree_4.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:pine_tree_3_3_1",
    deco_type = "schematic",
	place_on = {"terraria:dirt_with_coniferous_grass"}, 
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.002565,
    biomes = {"humid_coniferous_forest"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/pine_tree_3.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:pine_tree_4_4_1",
    deco_type = "schematic",
			place_on = {"terraria:dirt_with_coniferous_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.002565,
    biomes = {"humid_coniferous_forest"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/pine_tree_4.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:pine_tree_2_2_1",
    deco_type = "schematic",
			place_on = {"terraria:dirt_with_coniferous_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.002565,
    biomes = {"humid_coniferous_forest"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/pine_tree_2.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"terraria:dirt_with_coniferous_grass"},
	sidelen = 16,
	fill_ratio = 0.3,
	biomes = {"humid_coniferous_forest"},
	decoration = {
		"default:fern_1", "default:fern_2",
        "default:fern_3",
	}
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"terraria:dirt_with_coniferous_grass"},
	sidelen = 16,
	fill_ratio = 0.3,
	biomes = {"humid_coniferous_forest"},
	decoration = {
		"terraria:spruce_leaves_on_the_ground",
	}
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"terraria:dirt_with_coniferous_grass"},
	sidelen = 16,
	fill_ratio = 0.05,
	biomes = {"humid_coniferous_forest"},
	decoration = {
		"fireflies:firefly",
	}
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"terraria:dirt_with_coniferous_grass"},
	sidelen = 16,
	fill_ratio = 0.05,
	biomes = {"humid_coniferous_forest"},
	decoration = {
		"flowers:mushroom_brown", "flowers:mushroom_red",
	}
})
