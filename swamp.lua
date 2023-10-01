--[[
local S = minetest.get_translator("terraria")

minetest.register_node("terraria:root", {
	description = "Root",
	drawtype = "glasslike_framed_optional",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"terraria_root.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("terraria:root_with_mud", {
	description = S("Root With Mud"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"terraria_root_with_mud.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("terraria:mangrove_wood", {
	description = S("Mangrove Wood Planks"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"terraria_mangrove_wood.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("terraria:mud_brick", {
	description = S("Mud Bricks"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"mud_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, crumbly = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("terraria:mud_block", {
	description = S("Mud Blocks"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"mud_block.png"},
	is_ground_content = false,
	groups = {crumbly = 3, soil = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "sumpf", gain = 0.4},
	}),
})

minetest.register_node("terraria:mud", {
	description = "Mud",
	tiles = {"terraria_mud.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "sumpf", gain = 0.4},
	}),
})

minetest.register_globalstep(function(dtime)
    for _, player in ipairs(minetest.get_connected_players()) do
        local player_pos = player:get_pos()
        local player_node_pos = {
            x = math.floor(player_pos.x + 0.5),
            y = math.floor(player_pos.y + 0.5) - 1,
            z = math.floor(player_pos.z + 0.5) 
        }
        local player_node = minetest.get_node(player_node_pos)
        local player_name = player:get_player_name()

        if player_node.name == "terraria:mud" then
            local two_blocks_down_pos = {x = player_node_pos.x, y = player_node_pos.y - 1, z = player_node_pos.z}
            local two_blocks_down_node = minetest.get_node(two_blocks_down_pos)

            if two_blocks_down_node.name == "terraria:mud" then
                player:set_physics_override({speed = 0.70})
                player:set_physics_override({jump = 0.80})
            else
                player:set_physics_override({speed = 1.0})
                player:set_physics_override({jump = 1.0})
            end
        else
            player:set_physics_override({speed = 1.0})
            player:set_physics_override({jump = 1.0})
        end
    end
end)


minetest.register_node("terraria:dirt_with_swamp_grass", {
	description = S("Dirt with Swamp Grass"),
	tiles = {"terraria_swamp_grass.png", "terraria_mud.png",
		{name = "terraria_mud.png^terraria_swamp_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),

})

minetest.register_node("terraria:mangrove_tree", {
	description = S("Mangrove Tree"),
	tiles = {"terraria_mangrove_tree_top.png", "terraria_mangrove_tree_top.png",
		"terraria_mangrove_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("terraria:mangrove_leaves", {
	description = S("Mangrove Tree Leaves"),
	drawtype = "allfaces_optional",
	tiles = {"terraria_mangrove_leaves.png"},
	special_tiles = {"terraria_mangrove_leaves_simple.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"terraria:mangrove_sapling"}, rarity = 20},
			{items = {"terraria:mangrove_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = after_place_leaves,
})

default.register_fence("terraria:fence_mangrove_wood", {
	description = S("Mangrove Wood Fence"),
	texture = "terraria_fence_mangrove_wood.png",
	inventory_image = "default_fence_overlay.png^terraria_mangrove_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^terraria_mangrove_wood.png^" ..
				"default_fence_overlay.png^[makealpha:255,126,126",
	material = "terraria:mangrove_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})

default.register_fence_rail("terraria:fence_rail_mangrove_wood", {
	description = S("Mangrove Wood Fence Rail"),
	texture = "terraria_fence_rail_mangrove_wood.png",
	inventory_image = "default_fence_rail_overlay.png^terraria_mangrove_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_rail_overlay.png^terraria_mangrove_wood.png^" ..
				"default_fence_rail_overlay.png^[makealpha:255,126,126",
	material = "terraria:mangrove_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults()
})

default.register_mesepost("terraria:mese_post_light_mangrove_wood", {
	description = S("Mangrove Wood Mese Post Light"),
	texture = "terraria_fence_mangrove_wood.png",
	material = "terraria:mangrove_wood",
})

minetest.register_node("terraria:mangrove_sapling", {
	description = S("Mangrove Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"terraria_mangrove_sapling.png"},
	inventory_image = "terraria_mangrove_sapling.png",
	wield_image = "terraria_mangrove_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_new_mangrove_sapling,
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
			"terraria:mangrove_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -4, y = 1, z = -4},
			{x = 4, y = 7, z = 4},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

local function grow_new_mangrove_sapling(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-2, y = pos.y, z = pos.z-3}, minetest.get_modpath("terraria") .. "/schematics/mangrove_tree_1.mts", "0", nil, false)
end

if minetest.get_modpath("bonemeal") then
	bonemeal:add_sapling({
		{"terraria:mangrove_sapling", grow_new_mangrove_sapling, "soil"},
	})
end

if minetest.get_modpath("doors") then
doors.register_fencegate("terraria:gate_mangrove_wood", {
	description = S("Mangrove Wood Fence Gate"),
	texture = "terraria_mangrove_wood.png",
	material = "terraria:mangrove_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})
end

if minetest.get_modpath("stairs") then
	stairs.register_stair_and_slab("mangrove_wood", "terraria:mangrove_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"terraria_mangrove_wood.png"},
		S("Mangrove Wood Stair"),
		S("Mangrove Wood Slab"),
		default.node_sound_wood_defaults())
end

minetest.register_node("terraria:glass_bottle_with_water", {
	description = S("Water Glass Bottle"),
	drawtype = "plantlike",
	tiles = {"terraria_water_glass_bottle.png"},
	inventory_image = "terraria_water_glass_bottle.png",
	wield_image = "terraria_water_glass_bottle.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
  liquids_pointable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.override_item("vessels:glass_bottle",{
  liquids_pointable = true,
})

minetest.register_on_punchnode(function(pos, node, puncher)
    local player = puncher:get_player_name()
    local itemstack = puncher:get_wielded_item()
    local itemname = itemstack:get_name()

    if itemname == "vessels:glass_bottle" then
        if node.name == "default:water_source" or "default:river_water_source" then    
            itemstack:take_item()
            puncher:set_wielded_item(itemstack)
            local inv = puncher:get_inventory()
            if inv:room_for_item("main", "terraria:glass_bottle_with_water") then
                inv:add_item("main", "terraria:glass_bottle_with_water")
            else
                minetest.add_item(pos, "terraria:glass_bottle_with_water")
            end
        end
    end
end)

minetest.register_on_punchnode(function(pos, node, puncher)
    local player = puncher:get_player_name()
    local itemstack = puncher:get_wielded_item()
    local itemname = itemstack:get_name()

    if itemname == "terraria:glass_bottle_with_water" then
        if node.name == "default:water_source" or "default:river_water_source" then    
            itemstack:take_item()
            puncher:set_wielded_item(itemstack)
            local inv = puncher:get_inventory()
            if inv:room_for_item("main", "vessels:glass_bottle") then
                inv:add_item("main", "vessels:glass_bottle")
            else
                minetest.add_item(pos, "vessels:glass_bottle")
            end
        end
    end
end)

minetest.register_on_punchnode(function(pos, node, puncher)
    local player = puncher:get_player_name()
    local itemstack = puncher:get_wielded_item()
    local itemname = itemstack:get_name()

    if itemname == "terraria:glass_bottle_with_water" then
        if node.name == "default:dirt" then
            minetest.set_node(pos, {name = "terraria:mud"})     
            itemstack:take_item()
            puncher:set_wielded_item(itemstack)
            local inv = puncher:get_inventory()
            if inv:room_for_item("main", "vessels:glass_bottle") then
                inv:add_item("main", "vessels:glass_bottle")

            else
                minetest.add_item(pos, "vessels:glass_bottle")
            end
        end
    end
end)

minetest.register_craft({
	type = "fuel",
	recipe = "terraria:mangrove_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "terraria:root",
	burntime = 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = "terraria:root_with_mud",
	burntime = 8,
})

minetest.register_craft({
	type = "fuel",
	recipe = "terraria:fence_mangrove_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "terraria:fence_rail_mangrove_wood",
	burntime = 4,
})

minetest.register_craft({
	output = "terraria:mangrove_wood 4",
	recipe = {
		{"terraria:mangrove_tree"},
	}
})

minetest.register_craft({
	output = "default:stick 6",
	recipe = {
		{"terraria:root"},
	}
})

minetest.register_craft({
	output = "default:stick 3",
	recipe = {
		{"terraria:root_with_mud"},
	}
})

minetest.register_craft({
	output = "terraria:mud_block",
	recipe = {
		{"terraria:mud", "farming:wheat"},
	}
})

minetest.register_craft({
	output = "terraria:mud_brick",
	recipe = {
		{"terraria:mud_block", "terraria:mud_block",},
		{"terraria:mud_block", "terraria:mud_block"},
	}
})

if minetest.get_mapgen_setting("mg_name") == "v6" then
	default.register_leafdecay({
		trunks = {"terraria:mangrove_tree", "terraria:root"},
		leaves = {"terraria:mangrove_leaves"},
		radius = 3,
	})
end

default.register_leafdecay({
	trunks = {"terraria:mangrove_tree", "terraria:root"},
	leaves = {"terraria:mangrove_leaves"},
	radius = 3,
})


minetest.register_biome({
    name = "swamp",
    node_top = "terraria:dirt_with_swamp_grass",
    depth_top = 1,
    node_filler = "terraria:mud",
    depth_filler = 3,
    node_riverbed = "terraria:mud",
    depth_riverbed = 2,
    node_dungeon = "default:cobble",
    node_dungeon_alt = "default:mossycobble",
    node_dungeon_stair = "stairs:stair_cobble",
    y_max = 10,
    y_min = -20,
    heat_point = 80,
    humidity_point = 98,
})

	minetest.register_biome({
		name = "swamp_ocean",
		node_top = "terraria:mud",
		depth_top = 1,
		node_filler = "terraria:mud",
		depth_filler = 3,
		node_riverbed = "terraria:mud",
		depth_riverbed = 2,
		node_cave_liquid = "default:water_source",
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = -1,
		y_min = -255,
    heat_point = 80,
    humidity_point = 98,
	})

	minetest.register_biome({
		name = "swamp_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -31000,
    heat_point = 80,
    humidity_point = 98,
	})

function default.register_swamp_ores()
	minetest.register_ore({
		ore_type        = "blob",
		ore             = "terraria:mud", 
		wherein         = {"terraria:dirt_with_swamp_grass"},
		clust_scarcity  = 8 * 8 * 8, 
		clust_size      = 8,
		y_max           = 31000,
		y_min           = -31,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 15486,
			octaves = 1,
			persist = 0.0
		},
		biomes = {"swamp"}
	})

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:water_source", 
		wherein         = {"terraria:dirt_with_swamp_grass"},
		clust_scarcity  = 15 * 15 * 15, 
		clust_size      = 8,
		y_max           = 31000,
		y_min           = -31,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 2, y = 1, z = 2},
			seed = 15486,
			octaves = 1,
			persist = 0.0
		},
		biomes = {"swamp"}
	})

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "terraria:root_with_mud", 
		wherein         = {"terraria:mud"},
		clust_scarcity  = 15 * 15 * 15, 
		clust_size      = 8,
		y_max           = 31000,
		y_min           = -31,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 2, y = 1, z = 2},
			seed = 15486,
			octaves = 1,
			persist = 0.0
		},
		biomes = {"swamp"}
	})


end

default.register_swamp_ores()

minetest.register_decoration({
    name = "terraria:mangrove_tree_1",
    deco_type = "schematic",
    place_on = {"terraria:dirt_with_swamp_grass", "terraria:mud"},
    place_offset_y = 1,
    sidelen = 16,
    fill_ratio = 0.009365,
   biomes = {"swamp", "swamp_ocean"},
    y_max = 10,
    y_min = 1,
    schematic = minetest.get_modpath("terraria").."/schematics/mangrove_tree_1.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:mangrove_tree_1_3",
    deco_type = "schematic",
    place_on = {"terraria:dirt_with_swamp_grass", "terraria:mud"},
    place_offset_y = 1,
    sidelen = 16,
    fill_ratio = 0.045365,
   biomes = {"swamp", "swamp_ocean"},
    y_max = -3,
    y_min = -3,
    schematic = minetest.get_modpath("terraria").."/schematics/mangrove_tree_1_3.mts",
	flags = "force_placement, place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:mangrove_tree_1_2",
    deco_type = "schematic",
    place_on = {"terraria:dirt_with_swamp_grass", "terraria:mud"},
    place_offset_y = 1,
    sidelen = 16,
    fill_ratio = 0.045365,
   biomes = {"swamp", "swamp_ocean"},
    y_max = -2,
    y_min = -2,
    schematic = minetest.get_modpath("terraria").."/schematics/mangrove_tree_1_2.mts",
	flags = "force_placement, place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:mangrove_tree_1_1",
    deco_type = "schematic",
    place_on = {"terraria:dirt_with_swamp_grass", "terraria:mud"},
    place_offset_y = 1,
    sidelen = 16,
    fill_ratio = 0.045365,
   biomes = {"swamp", "swamp_ocean"},
    y_max = -1,
    y_min = -1,
    schematic = minetest.get_modpath("terraria").."/schematics/mangrove_tree_1_1.mts",
	flags = "force_placement, place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:mangrove_tree_1_0",
    deco_type = "schematic",
    place_on = {"terraria:dirt_with_swamp_grass", "terraria:mud"},
    place_offset_y = 1,
    sidelen = 16,
    fill_ratio = 0.045365,
   biomes = {"swamp", "swamp_ocean"},
    y_max = -1,
    y_min = -1,
    schematic = minetest.get_modpath("terraria").."/schematics/mangrove_tree_1_0.mts",
	flags = "force_placement, place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:mangrove_tree_2",
    deco_type = "schematic",
    place_on = {"terraria:dirt_with_swamp_grass", "terraria:mud"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.009365,
   biomes = {"swamp", "swamp_ocean"},
    y_max = 10,
    y_min = 1,
    schematic = minetest.get_modpath("terraria").."/schematics/mangrove_tree_2.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:mangrove_tree_3",
    deco_type = "schematic",
    place_on = {"terraria:dirt_with_swamp_grass", "terraria:mud"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.009365,
   biomes = {"swamp", "swamp_ocean"},
    y_max = 10,
    y_min = 1,
    schematic = minetest.get_modpath("terraria").."/schematics/mangrove_tree_3.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
    name = "terraria:mangrove_tree_4",
    deco_type = "schematic",
    place_on = {"terraria:dirt_with_swamp_grass", "terraria:mud"},
    place_offset_y = 0,
    sidelen = 16,
    fill_ratio = 0.009365,
   biomes = {"swamp", "swamp_ocean"},
    y_max = 10,
    y_min = 1,
    schematic = minetest.get_modpath("terraria").."/schematics/mangrove_tree_4.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})







local function register_mgv6_waterlily()
	minetest.register_decoration({
		name = "flowers:waterlily",
		deco_type = "simple",
		place_on = {"terraria:mud", "terraria:dirt_with_swamp_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.12,
			scale = 0.3,
			spread = {x = 100, y = 100, z = 100},
			seed = 33,
			octaves = 3,
			persist = 0.7
		},
		y_max = 0,
		y_min = 0,
		decoration = "flowers:waterlily_waving",
		param2 = 0,
		param2_max = 3,
		place_offset_y = 1,
	})
end

local function register_waterlily()
    minetest.register_decoration({
        name = "swamp:waterlily",
        deco_type = "simple",
        place_on = {"terraria:mud", "terraria:dirt_with_swamp_grass", "default:water_source"},
        sidelen = 16,
        noise_params = {
            offset = -0.12,
            scale = 0.5,
            spread = {x = 200, y = 200, z = 200},
            seed = 33,
            octaves = 3,
            persist = 0.9
        },
       biomes = {"swamp", "swamp_ocean"},
        y_max = 0,
        y_min = 0,
        decoration = "flowers:waterlily_waving",
        param2 = 0,
        param2_max = 3,
        place_offset_y = 1,
    })


end
register_waterlily()

minetest.register_decoration({
	deco_type = "simple",
		place_on = {"terraria:dirt_with_swamp_grass"},
	sidelen = 16,
	fill_ratio = 0.05,
	biomes = {"swamp"},
	decoration = {
		"fireflies:firefly",
	}
})

minetest.register_decoration({
    deco_type = "simple",
        place_on = {"default:water", "default:water_source"},
    sidelen = 16,
    fill_ratio = 0.15,
   biomes = {"swamp", "swamp_ocean"},
decoration = "flowers:waterlily_waving",

})

minetest.register_decoration({
	deco_type = "simple",
		place_on = {"terraria:dirt_with_swamp_grass"},
	sidelen = 16,
	fill_ratio = 0.15,
	biomes = {"swamp"},
	decoration = {
		"default:junglegrass", "default:fern_4", "default:fern_5",
	}
})

minetest.register_decoration({
	deco_type = "simple",
		place_on = {"terraria:dirt_with_swamp_grass"},
	sidelen = 16,
		y_max = 10,
		y_min = 1,
	fill_ratio = 0.05,
	biomes = {"swamp"},
	decoration = {
		"flowers:mushroom_brown",
	}
})
]]