if minetest.get_modpath("bonemeal") then
	bonemeal:add_deco({
		{"terraria:temperate_forest_dirt_with_grass", {"terraria:temperate_forest_grass_1", "terraria:temperate_forest_grass_2", "terraria:temperate_forest_grass_3", "terraria:temperate_forest_grass_4", "terraria:temperate_forest_grass_5"},
			{"flowers:dandelion_white", "flowers:viola", "flowers:dandelion_yellow", "flowers:chrysanthemum_green"} }
	})
	bonemeal:add_deco({
		{"terraria:dirt_with_coniferous_grass", {"default:fern_1", "default:fern_2", "default:fern_3", "terraria:spruce_leaves_on_the_ground"},
			{"flowers:mushroom_brown"} }
	})
	bonemeal:add_deco({
		{"terraria:temperate_coniferous_forest_dirt_with_grass", {"default:fern_1", "default:fern_2", "default:fern_3", "default:grass_3", "default:grass_4", "default:grass_5"},
			{"flowers:mushroom_brown"} }
	})
	bonemeal:add_deco({
		{"terraria:dirt_with_swamp_grass", {"default:junglegrass", "default:fern_2", "default:fern_3"},
			{"flowers:mushroom_brown"} }
	})
end
