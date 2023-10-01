local S = minetest.get_translator("variety")
if minetest.get_modpath("moreblocks") then
	stairsplus:register_all("oak_tree", "wood", "terraria:oak_tree", {
		description = S("Oak Tree"),
		tiles = {"terraria_oak_tree.png"},
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	    sounds = default.node_sound_wood_defaults(),
	})

	stairsplus:register_all("oak_wood", "wood", "terraria:oak_wood", {
		description = S("Oak Wood"),
		tiles = {"terraria_oak_wood.png"},
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	    sounds = default.node_sound_wood_defaults(),
	})

	stairsplus:register_all("mapple_tree", "wood", "terraria:mapple_tree", {
		description = S("Mapple Tree"),
		tiles = {"terraria_mapple_tree.png"},
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	    sounds = default.node_sound_wood_defaults(),
	})

	stairsplus:register_all("mapple_wood", "wood", "terraria:mapple_wood", {
		description = S("Mapple Wood"),
		tiles = {"terraria_mapple_wood.png"},
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	    sounds = default.node_sound_wood_defaults(),
	})

	stairsplus:register_all("beech_tree", "wood", "terraria:beech_tree", {
		description = S("Beech Tree"),
		tiles = {"terraria_beech_tree.png"},
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	    sounds = default.node_sound_wood_defaults(),
	})

	stairsplus:register_all("beech_wood", "wood", "terraria:beech_wood", {
		description = S("Beech Wood"),
		tiles = {"terraria_beech_wood.png"},
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	    sounds = default.node_sound_wood_defaults(),
	})

	stairsplus:register_all("mangrove_tree", "wood", "terraria:mangrove_tree", {
		description = S("Mangrove Tree"),
		tiles = {"terraria_mangrove_tree.png"},
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	    sounds = default.node_sound_wood_defaults(),
	})

	stairsplus:register_all("mangrove_wood", "wood", "terraria:mangrove_wood", {
		description = S("Mangrove Wood"),
		tiles = {"terraria_mangrove_wood.png"},
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
	    sounds = default.node_sound_wood_defaults(),
	})
end
