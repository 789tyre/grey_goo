function eat_water(pos)
	local is_grown = false
	for nx = -1, 1, 1 do
		for nz = -1, 1, 1 do
			for ny = -1, 1,1 do
				if nx == 0 and ny == 0 and nz == 0 then
					
				else
					local current_pos = {x=(pos.x+nx), y=(pos.y+ny), z=(pos.z+nz)}
					local current_node = minetest.get_node(current_pos)
					if current_node.name == "default:water_source" or current_node.name == "default:water_flowing" then
						is_grown = true
						minetest.remove_node(current_pos)
						minetest.add_node(current_pos, {name = "grey_goo:blue_goo_off"})
					end
				end
			end
		end
	end
	if is_grown then 
		minetest.remove_node(pos) 
	end
end

minetest.register_node("grey_goo:green_goo", {
		description = "Green Goo",
		tiles = {"green_goo.png"},
		paramtype = "light",
		light_source = 7,
		groups = {dig_immediate = 3},
		is_ground_content = false,
		paramtype = "light",
		light_source = 0
	
})
minetest.register_node("grey_goo:blue_goo_off", {
	description = "Blue Goo",
	tiles = {"blue_goo.png"},
	paramtype = "light",
	light_source = 0,
	groups = {dig_immediate = 3},
	is_ground_content = false,
	on_rightclick = function (pos, node)
		--minetest.swap_node(pos, {name = "grey_goo:blue_goo_on", param2 = node.param2})
		--minetest.get_node_timer(pos):start(1)
		eat_water(pos)
	end
})

minetest.register_node("grey_goo:blue_goo_on", {
	tiles = {"blue_goo.png"},
	groups = {not_in_creative_inventory = 1, dig_immediate = 3},
	drop = "grey_goo:blue_goo_off",
	light_source = 14,
	on_timer = function (pos)
		minetest.swap_node(pos, {name = "grey_goo:blue_goo_off", 0, 0})
	end
})

minetest.register_craft({
	type = "shapeless",
	output = "grey_goo:green_goo",
	recipe = {"default:dirt"},
})
minetest.register_craft({
	type = "shapeless",
	output = "grey_goo:green_goo 4",
	recipe = {"grey_goo:green_goo"}
})

minetest.register_craft({
	type = "shaped",
	output = "grey_goo:blue_goo_off",
	recipe = {
				{"grey_goo:green_goo", ""},
				{"", "grey_goo:green_goo"}
			 }
})
minetest.register_craft({
	type = "shapeless",
	output = "grey_goo:blue_goo_off 4",
	recipe = {"grey_goo:blue_goo_off"}
})