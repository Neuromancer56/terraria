local S = minetest.get_translator("terraria")
-----------------------------------------------
---------------Oak Tree---------------------
-----------------------------------------------
minetest.register_node("terraria:oak_tree", {
	description = S("Oak Tree"),
	tiles = {"terraria_oak_tree_top.png", "terraria_oak_tree_top.png",
		"terraria_oak_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("terraria:oak_wood", {
	description = S("Oak Wood Planks"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"terraria_oak_wood.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

default.register_fence("terraria:fence_oak_wood", {
	description = S("Oak Wood Fence"),
	texture = "terraria_fence_oak_wood.png",
	inventory_image = "default_fence_overlay.png^terraria_oak_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^terraria_oak_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = "terraria:oak_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence_rail("terraria:fence_rail_oak_wood", {
	description = S("Oak Wood Fence Rail"),
	texture = "terraria_fence_rail_oak_wood.png",
	inventory_image = "default_fence_rail_overlay.png^terraria_oak_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^terraria_oak_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = "terraria:oak_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})

default.register_mesepost("terraria:mese_post_light_oak_wood", {
	description = S("Oak Wood Mese Post Light"),
	texture = "terraria_fence_oak_wood.png",
	material = "terraria:oak_wood",
})

minetest.register_node("terraria:oak_leaves", {
	description = S("Oak Tree Leaves"),
	drawtype = "allfaces_optional",
	tiles = {"terraria_oak_leaves.png"},
	special_tiles = {"terraria_oak_leaves_simple.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"terraria:oak_sapling"}, rarity = 20},
			{items = {"terraria:oak_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = after_place_leaves,
})

minetest.register_node("terraria:oak_sapling", {
	description = S("Oak Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"terraria_oak_sapling.png"},
	inventory_image = "terraria_oak_sapling.png",
	wield_image = "terraria_oak_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_new_oak_sapling,
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
			"terraria:oak_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 7, z = 4},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

local function grow_new_oak_sapling(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-2, y = pos.y, z = pos.z-3}, minetest.get_modpath("terraria") .. "/schematics/oak_tree_3.mts", "0", nil, false)
end

if minetest.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"terraria:oak_sapling", grow_new_oak_sapling, "soil"},
	})
end

if minetest.get_modpath("doors") then
doors.register_fencegate("terraria:gate_oak_wood", {
	description = S("Oak Wood Fence Gate"),
	texture = "terraria_oak_wood.png",
	material = "terraria:oak_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})
end

if minetest.get_modpath("stairs") then
	stairs.register_stair_and_slab("oak_wood", "terraria:oak_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"terraria_oak_wood.png"},
		S("Oak Wood Stair"),
		S("Oak Wood Slab"),
		default.node_sound_wood_defaults())
end

minetest.register_craft({
	type = "fuel",
	recipe = "terraria:oak_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "terraria:fence_oak_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "terraria:fence_rail_oak_wood",
	burntime = 4,
})

minetest.register_craft({
	output = "terraria:oak_wood 4",
	recipe = {
		{"terraria:oak_tree"},
	}
})

if minetest.get_mapgen_setting("mg_name") == "v6" then
	default.register_leafdecay({
		trunks = {"terraria:oak_tree"},
		leaves = {"terraria:oak_leaves"},
		radius = 3,
	})
end

default.register_leafdecay({
	trunks = {"terraria:oak_tree"},
	leaves = {"terraria:oak_leaves"},
	radius = 3,
})

-----------------------------------------------
---------------Mapple Tree---------------------
-----------------------------------------------
minetest.register_node("terraria:mapple_leaves", {
	description = S("Mapple Tree Leaves"),
	drawtype = "allfaces_optional",
	tiles = {"terraria_mapple_leaves.png"},
	special_tiles = {"terraria_mapple_leaves_simple.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"terraria:mapple_sapling"}, rarity = 20},
			{items = {"terraria:mapple_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = after_place_leaves,
})

minetest.register_node("terraria:mapple_tree", {
	description = S("Mapple Tree"),
	tiles = {"terraria_mapple_tree_top.png", "terraria_mapple_tree_top.png",
		"terraria_mapple_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("terraria:mapple_wood", {
	description = S("Mapple Wood Planks"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"terraria_mapple_wood.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

default.register_fence("terraria:fence_mapple_wood", {
	description = S("Mapple Wood Fence"),
	texture = "terraria_fence_mapple_wood.png",
	inventory_image = "default_fence_overlay.png^terraria_mapple_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^terraria_mapple_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = "terraria:mapple_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence_rail("terraria:fence_rail_mapple_wood", {
	description = S("Mapple Wood Fence Rail"),
	texture = "terraria_fence_rail_mapple_wood.png",
	inventory_image = "default_fence_rail_overlay.png^terraria_mapple_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^terraria_mapple_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = "terraria:mapple_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})

default.register_mesepost("terraria:mese_post_light_mapple_wood", {
	description = S("Mapple Wood Mese Post Light"),
	texture = "terraria_fence_mapple_wood.png",
	material = "terraria:mapple_wood",
})

if minetest.get_modpath("doors") then
doors.register_fencegate("terraria:gate_mapple_wood", {
	description = S("Mapple Wood Fence Gate"),
	texture = "terraria_mapple_wood.png",
	material = "terraria:mapple_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})
end

if minetest.get_modpath("stairs") then
	stairs.register_stair_and_slab("mapple_wood", "terraria:mapple_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"terraria_mapple_wood.png"},
		S("Mapple Wood Stair"),
		S("Mapple Wood Slab"),
		default.node_sound_wood_defaults())
end

if minetest.get_mapgen_setting("mg_name") == "v6" then
	default.register_leafdecay({
		trunks = {"terraria:mapple_tree"},
		leaves = {"terraria:mapple_leaves"},
		radius = 3,
	})
end

minetest.register_node("terraria:mapple_sapling", {
	description = S("Mapple Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"terraria_mapple_sapling.png"},
	inventory_image = "terraria_mapple_sapling.png",
	wield_image = "terraria_mapple_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_new_mapple_sapling,
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
			"terraria:mapple_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 7, z = 4},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

local function grow_new_mapple_sapling(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-2, y = pos.y, z = pos.z-3}, minetest.get_modpath("terraria") .. "/schematics/mapple_tree_3.mts", "0", nil, false)
end

if minetest.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"terraria:mapple_sapling", grow_new_mapple_sapling, "soil"},
	})
end

default.register_leafdecay({
	trunks = {"terraria:mapple_tree"},
	leaves = {"terraria:mapple_leaves"},
	radius = 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = "terraria:mapple_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "terraria:fence_mapple_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "terraria:fence_rail_mapple_wood",
	burntime = 4,
})

minetest.register_craft({
	output = "terraria:mapple_wood 4",
	recipe = {
		{"terraria:mapple_tree"},
	}
})

-----------------------------------------------
---------------Beech Tree---------------------
-----------------------------------------------
minetest.register_node("terraria:beech_leaves", {
	description = S("Beech Tree Leaves"),
	drawtype = "allfaces_optional",
	tiles = {"terraria_beech_leaves.png"},
	special_tiles = {"terraria_beech_leaves_simple.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"terraria:beech_sapling"}, rarity = 20},
			{items = {"terraria:beech_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = after_place_leaves,
})

minetest.register_node("terraria:beech_tree", {
	description = S("Beech Tree"),
	tiles = {"terraria_beech_tree_top.png", "terraria_beech_tree_top.png",
		"terraria_beech_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})


minetest.register_node("terraria:beech_wood", {
	description = S("Beech Wood Planks"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"terraria_beech_wood.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

default.register_fence("terraria:fence_beech_wood", {
	description = S("Beech Wood Fence"),
	texture = "terraria_fence_beech_wood.png",
	inventory_image = "default_fence_overlay.png^terraria_beech_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^terraria_beech_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = "terraria:beech_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence_rail("terraria:fence_rail_beech_wood", {
	description = S("Beech Wood Fence Rail"),
	texture = "terraria_fence_rail_beech_wood.png",
	inventory_image = "default_fence_rail_overlay.png^terraria_beech_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^terraria_beech_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = "terraria:beech_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})

default.register_mesepost("terraria:mese_post_light_beech_wood", {
	description = S("Beech Wood Mese Post Light"),
	texture = "terraria_fence_beech_wood.png",
	material = "terraria:beech_wood",
})

if minetest.get_modpath("doors") then
doors.register_fencegate("terraria:gate_beech_wood", {
	description = S("Beech Wood Fence Gate"),
	texture = "terraria_beech_wood.png",
	material = "terraria:beech_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})
end

if minetest.get_modpath("stairs") then
	stairs.register_stair_and_slab("beech_wood", "terraria:beech_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"terraria_beech_wood.png"},
		S("Beech Wood Stair"),
		S("Beech Wood Slab"),
		default.node_sound_wood_defaults())
end

if minetest.get_mapgen_setting("mg_name") == "v6" then
	default.register_leafdecay({
		trunks = {"terraria:beech_tree"},
		leaves = {"terraria:beech_leaves"},
		radius = 3,
	})
end

minetest.register_node("terraria:beech_sapling", {
	description = S("Beech Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"terraria_beech_sapling.png"},
	inventory_image = "terraria_beech_sapling.png",
	wield_image = "terraria_beech_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_new_beech_sapling,
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
			"terraria:beech_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 7, z = 4},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

local function grow_new_beech_sapling(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-2, y = pos.y, z = pos.z-3}, minetest.get_modpath("terraria") .. "/schematics/beech_tree_3.mts", "0", nil, false)
end

if minetest.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"terraria:beech_sapling", grow_new_beech_sapling, "soil"},
	})
end


default.register_leafdecay({
	trunks = {"terraria:beech_tree"},
	leaves = {"terraria:beech_leaves"},
	radius = 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = "terraria:beech_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "terraria:fence_beech_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "terraria:fence_rail_beech_wood",
	burntime = 4,
})

minetest.register_craft({
	output = "terraria:beech_wood 4",
	recipe = {
		{"terraria:beech_tree"},
	}
})

minetest.register_node("terraria:temperate_forest_dirt_with_grass", {
	description = S("Dirt with Temperate Forest Grass"),
	tiles = {"terraria_temperate_forest_grass.png", "default_dirt.png",
		{name = "default_dirt.png^terraria_temperate_forest_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("terraria:temperate_forest_grass_1", {
	description = S("Temperate Forest Grass"),
	drawtype = "plantlike",
	waving = 1,
	tiles = {"terraria_temperate_forest_grass_1.png"},
	-- Use texture of a taller grass stage in inventory
	inventory_image = "terraria_temperate_forest_grass_3.png",
	wield_image = "terraria_temperate_forest_grass_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1,
		normal_grass = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random grass node
		local stack = ItemStack("terraria:temperate_forest_grass_" .. math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("terraria:temperate_forest_grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	minetest.register_node("terraria:temperate_forest_grass_" .. i, {
		description = S("Temperate Forest Grass"),
		drawtype = "plantlike",
		waving = 1,
		tiles = {"terraria_temperate_forest_grass_" .. i .. ".png"},
		inventory_image = "terraria_temperate_forest_grass_" .. i .. ".png",
		wield_image = "terraria_temperate_forest_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "terraria:temperate_forest_grass_1",
		groups = {snappy = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory = 1, grass = 1,
			normal_grass = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},
	})
end

	minetest.register_biome({
		name = "temperate_grassland",
		node_top = "terraria:temperate_forest_dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 2,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 6,
		heat_point = 55,
		humidity_point = 45,
	})


	minetest.register_biome({
		name = "temperate_forest",
		node_top = "terraria:temperate_forest_dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 2,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 6,
		heat_point = 50,
		humidity_point = 55,
	})

	minetest.register_biome({
		name = "temperate_grassland_dunes",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 2,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = 5,
		y_min = 4,
		heat_point = 55,
		humidity_point = 45,
	})

	minetest.register_biome({
		name = "temperate_grassland_ocean",
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
		heat_point = 55,
		humidity_point = 45,
	})

	minetest.register_biome({
		name = "temperate_grassland_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 55,
		humidity_point = 45,
	})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"terraria:temperate_forest_dirt_with_grass"},
	sidelen = 16,
	fill_ratio = 0.4,
	biomes = {"temperate_grassland"},
	decoration = {
		"terraria:temperate_forest_grass_1", "terraria:temperate_forest_grass_2",
		"terraria:temperate_forest_grass_3", "terraria:temperate_forest_grass_4",
		"terraria:temperate_forest_grass_5",
	}
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"terraria:temperate_forest_dirt_with_grass"},
	sidelen = 16,
	fill_ratio = 0.02,
	biomes = {"temperate_grassland"},
	decoration = {
		"flowers:dandelion_white", "flowers:viola",
		"flowers:dandelion_yellow",
		"flowers:chrysanthemum_green",
	}
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"terraria:temperate_forest_dirt_with_grass"},
	sidelen = 16,
	fill_ratio = 0.05,
	biomes = {"temperate_grassland", "temperate_forest"},
	decoration = {
		"fireflies:firefly",
	}
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"terraria:temperate_forest_dirt_with_grass"},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"temperate_grassland", "temperate_forest"},
	decoration = {
		"fireflies:firefly", "butterflies:butterfly_red",
		"butterflies:butterfly_violet", "butterflies:butterfly_white",
	}
})

minetest.register_decoration({
    name = "terraria:oak_tree_3",
    deco_type = "schematic",
    place_on = {"terraria:temperate_forest_dirt_with_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.001365,
    biomes = {"temperate_grassland"},
    y_max = 31000,
    y_min = 1,
    schematic = minetest.get_modpath("terraria").."/schematics/oak_tree_3.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:mapple_tree_3",
    deco_type = "schematic",
    place_on = {"terraria:temperate_forest_dirt_with_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.003365,
    biomes = {"temperate_grassland"},
    y_max = 31000,
    y_min = 1,
    schematic = minetest.get_modpath("terraria").."/schematics/mapple_tree_3.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:beech_tree_3",
    deco_type = "schematic",
    place_on = {"terraria:temperate_forest_dirt_with_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.003365,
    biomes = {"temperate_grassland"},
    y_max = 31000,
    y_min = 1,
    schematic = minetest.get_modpath("terraria").."/schematics/beech_tree_3.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})


minetest.register_decoration({
    name = "terraria:mapple_tree_2",
    deco_type = "schematic",
    place_on = {"terraria:temperate_forest_dirt_with_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.005365,
    biomes = {"temperate_grassland"},
    y_max = 31000,
    y_min = 1,
    schematic = minetest.get_modpath("terraria").."/schematics/mapple_tree_2.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:beech_tree_2",
    deco_type = "schematic",
    place_on = {"terraria:temperate_forest_dirt_with_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.005365,
    biomes = {"temperate_grassland"},
    y_max = 31000,
    y_min = 1,
    schematic = minetest.get_modpath("terraria").."/schematics/beech_tree_2.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:boulder_1",
    deco_type = "schematic",
    place_on = {"terraria:temperate_forest_dirt_with_grass"},
    place_offset_y = -2,
    sidelen = 16,
    fill_ratio = 0.0015565,
    biomes = {"temperate_grassland", "temperate_forest"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/boulder_1.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:boulder_2",
    deco_type = "schematic",
    place_on = {"terraria:temperate_forest_dirt_with_grass"},
    place_offset_y = -2,
    sidelen = 16,
    fill_ratio = 0.0015565,
    biomes = {"temperate_grassland", "temperate_forest"},
    y_max = 31000,
    y_min = -20,
    schematic = minetest.get_modpath("terraria").."/schematics/boulder_2.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})


-------------------------------------------
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"terraria:temperate_forest_dirt_with_grass"},
	sidelen = 16,
	fill_ratio = 0.5,
	biomes = {"temperate_forest"},
	decoration = {
		"terraria:temperate_forest_grass_3", "terraria:temperate_forest_grass_4",
		"terraria:temperate_forest_grass_5",
	}
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"terraria:temperate_forest_dirt_with_grass"},
	sidelen = 16,
	fill_ratio = 0.01,
	biomes = {"temperate_forest"},
	decoration = {
		"flowers:dandelion_white", "flowers:viola",
		"flowers:dandelion_yellow",
		"flowers:chrysanthemum_green",
	}
})

minetest.register_decoration({
    name = "terraria:oak_tree_3",
    deco_type = "schematic",
    place_on = {"terraria:temperate_forest_dirt_with_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.030365/5,
    biomes = {"temperate_forest"},
    y_max = 31000,
    y_min = 1,
    schematic = minetest.get_modpath("terraria").."/schematics/oak_tree_3.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:mapple_tree_3",
    deco_type = "schematic",
    place_on = {"terraria:temperate_forest_dirt_with_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.030365/5,
    biomes = {"temperate_forest"},
    y_max = 31000,
    y_min = 1,
    schematic = minetest.get_modpath("terraria").."/schematics/mapple_tree_3.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:beech_tree_3",
    deco_type = "schematic",
    place_on = {"terraria:temperate_forest_dirt_with_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.030365/5,
    biomes = {"temperate_forest"},
    y_max = 31000,
    y_min = 1,
    schematic = minetest.get_modpath("terraria").."/schematics/beech_tree_3.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})


minetest.register_decoration({
    name = "terraria:mapple_tree_2",
    deco_type = "schematic",
    place_on = {"terraria:temperate_forest_dirt_with_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.023365/5,
    biomes = {"temperate_forest"},
    y_max = 31000,
    y_min = 1,
    schematic = minetest.get_modpath("terraria").."/schematics/mapple_tree_2.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:beech_tree_2",
    deco_type = "schematic",
    place_on = {"terraria:temperate_forest_dirt_with_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.023365/5,
    biomes = {"temperate_forest"},
    y_max = 31000,
    y_min = 1,
    schematic = minetest.get_modpath("terraria").."/schematics/beech_tree_2.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:oak_tree_1",
    deco_type = "schematic",
    place_on = {"terraria:temperate_forest_dirt_with_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.011365/8,
    biomes = {"temperate_forest"},
    y_max = 31000,
    y_min = 1,
    schematic = minetest.get_modpath("terraria").."/schematics/oak_tree_1.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:mapple_tree_1",
    deco_type = "schematic",
    place_on = {"terraria:temperate_forest_dirt_with_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.011365/8,
    biomes = {"temperate_forest"},
    y_max = 31000,
    y_min = 1,
    schematic = minetest.get_modpath("terraria").."/schematics/mapple_tree_1.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:beech_tree_1",
    deco_type = "schematic",
    place_on = {"terraria:temperate_forest_dirt_with_grass"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.011365/8,
    biomes = {"temperate_forest"},
    y_max = 31000,
    y_min = 1,
    schematic = minetest.get_modpath("terraria").."/schematics/beech_tree_1.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})
----------------------------------------------------
	minetest.register_decoration({
		name = "terraria:beech_log_1",
		deco_type = "schematic",
		place_on = {"terraria:temperate_forest_dirt_with_grass"},
		place_offset_y = 1,
		sidelen = 16,
		noise_params = {
			offset = 0.0012,
			scale = 0.0007,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"temperate_forest", "temperate_grassland"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("terraria") .. "/schematics/beech_log_1.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = "terraria:temperate_forest_dirt_with_grass",
		num_spawn_by = 8,
	})

	minetest.register_decoration({
		name = "terraria:oak_log_1",
		deco_type = "schematic",
		place_on = {"terraria:temperate_forest_dirt_with_grass"},
		place_offset_y = 1,
		sidelen = 16,
		noise_params = {
			offset = 0.0012,
			scale = 0.0007,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"temperate_forest", "temperate_grassland"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("terraria") .. "/schematics/oak_log_1.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = "terraria:temperate_forest_dirt_with_grass",
		num_spawn_by = 8,
	})

	minetest.register_decoration({
		name = "terraria:mapple_log_1",
		deco_type = "schematic",
		place_on = {"terraria:temperate_forest_dirt_with_grass"},
		place_offset_y = 1,
		sidelen = 16,
		noise_params = {
			offset = 0.0012,
			scale = 0.0007,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"temperate_forest", "temperate_grassland"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("terraria") .. "/schematics/mapple_log_1.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = "terraria:temperate_forest_dirt_with_grass",
		num_spawn_by = 8,
	})

	minetest.register_decoration({
		name = "terraria:beech_bush_1",
		deco_type = "schematic",
		place_on = {"terraria:temperate_forest_dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 137,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"temperate_forest", "temperate_grassland"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("terraria") .. "/schematics/beech_bush_1.mts",
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		name = "terraria:oak_bush_1",
		deco_type = "schematic",
		place_on = {"terraria:temperate_forest_dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 137,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"temperate_forest", "temperate_grassland"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("terraria") .. "/schematics/oak_bush_1.mts",
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		name = "terraria:mapple_bush_1",
		deco_type = "schematic",
		place_on = {"terraria:temperate_forest_dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 137,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"temperate_forest", "temperate_grassland"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("terraria") .. "/schematics/mapple_bush_1.mts",
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		name = "terraria:blueberry_bush_1",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass", "default:dirt_with_snow"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 697,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"temperate_forest", "temperate_grassland"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/blueberry_bush.mts",
		flags = "place_center_x, place_center_z",
	})


--Dungeon loot

if minetest.global_exists("dungeon_loot") then
	dungeon_loot.register ({
		{name = "terraria:oak_tree", chance = 0.3, count = {2, 4}},
		{name = "terraria:beech_tree", chance = 0.3, count = {2, 4}},
		{name = "terraria:mapple_tree", chance = 0.3, count = {2, 4}},

		{name = "terraria:mapple_sapling", chance = 0.3, count = {2, 4}},
		{name = "terraria:beech_leaves", chance = 0.3, count = {2, 4}},
	})	
end
